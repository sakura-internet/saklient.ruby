$: << File.dirname(__dir__) + '/lib'
require 'saclient/cloud/api'
require 'date'
require 'SecureRandom'

describe 'Server' do
  
  
  
  before do
    
    # load config file
    root = File.dirname(__dir__)
    test_ok_file = root + '/testok'
    expect(File).to exist(test_ok_file)
    config_file = root + '/config.sh'
    expect(File).to exist(config_file)
    @config = {}
    fh = open(config_file)
    fh.each {|line|
      if /^\s*export\s+(\w+)\s*=\s*(.+?)\s*$/.match(line) then
        key = $1
        value = $2
        @config[key.to_sym] = value.gsub(/'([^']*)'|"([^"]*)"|\\(.)|(.)/) {|m|
          $1 || $2 || $3 || $4
        }
      end
    }
    fh.close
    expect(@config[:SACLOUD_TOKEN]).not_to be_empty #'SACLOUD_TOKEN must be defined in config.sh'
    expect(@config[:SACLOUD_SECRET]).not_to be_empty #'SACLOUD_SECRET must be defined in config.sh'
    #expect(@config[:SACLOUD_ZONE]).not_to be_empty #'SACLOUD_ZONE must be defined in config.sh'
    
    # authorize
    @api = Saclient::Cloud::API::authorize(@config[:SACLOUD_TOKEN], @config[:SACLOUD_SECRET])
    @api = @api.inZone(@config[:SACLOUD_ZONE]) if @config[:SACLOUD_ZONE]
    expect(@api).to be_an_instance_of Saclient::Cloud::API
    
  end
  
  
  
  it 'should be found' do
    
    servers = @api.server.find
    expect(servers).to be_an_instance_of Array
    expect(servers.length).to be >= 1
    
    servers.each {|server|
      expect(server).to be_an_instance_of Saclient::Cloud::Resource::Server
      expect(server.plan).to be_an_instance_of Saclient::Cloud::Resource::ServerPlan
      expect(server.plan.cpu).to be >= 1
      expect(server.plan.memory_mib).to be >= 1
      expect(server.plan.memory_gib).to be >= 1
      expect(server.plan.memory_mib / server.plan.memory_gib).to eq 1024
      expect(server.tags).to be_an_instance_of Array
      server.tags.each {|tag|
        expect(tag).to be_an_instance_of String
      }
    }
    
  end
  
  
  
  it 'should be CRUDed' do
    name = '!ruby_rspec-' + DateTime.now.strftime('%Y%m%d_%H%M%S') + '-' + SecureRandom.uuid[0, 8]
    description = 'This instance was created by saclient.ruby rspec'
    tag = 'saclient-test'
    cpu = 1
    mem = 2
    
    # search archives
    puts 'searching archives...'
    archives = @api.archive.with_name_like('CentOS 6.5 64bit').with_size_gib(20).with_shared_scope.limit(1).find
    # printf "found %d archive(s)\n", archives.length
    archive = archives[0]
    # p archive.dump
    
    # create a disk
    puts 'creating a disk...'
    disk = @api.disk.create
    disk.name = '!ruby_rspec-' + DateTime.now.strftime('%Y%m%d_%H%M%S') + '-' + SecureRandom.uuid[0, 8]
    disk.description = 'This instance was created by saclient.ruby rspec'
    disk.tags = ['saclient-test']
    disk.source = archive
    disk.save
    # p disk.dump
    
    # create a server
    puts 'creating a server...'
    server = @api.server.create
    expect(server).to be_an_instance_of Saclient::Cloud::Resource::Server
    server.name = name
    server.description = description
    server.tags = [tag]
    server.plan = @api.product.server.get_by_spec(cpu, mem)
    server.save
    
    # check the server properties
    expect(server.id.to_i).to be >= 1
    expect(server.name).to eq name
    expect(server.description).to eq description
    expect(server.tags).to be_an_instance_of Array
    expect(server.tags.length).to eq 1
    expect(server.tags[0]).to eq tag
    expect(server.plan.cpu).to eq cpu
    expect(server.plan.memory_gib).to eq mem
    
    # wait disk copy
    puts 'waiting disk copy...'
    fail 'アーカイブからディスクへのコピーがタイムアウトしました' unless disk.sleep_while_copying
    # p disk.dump
    disk.source = nil
    disk.reload
    expect(disk.source).to be_an_instance_of Saclient::Cloud::Resource::Archive
    expect(disk.source.id).to eq archive.id
    expect(disk.size_gib).to eq archive.size_gib
    
    # connect the disk to the server
    puts 'connecting the disk to the server...'
    disk.connect_to(server)
    
    # boot
    puts 'booting the server...'
    server.boot
    sleep 1
    server.reload
    expect(server.instance.status).to eq Saclient::Cloud::Enums::EServerInstanceStatus::up
    
    # boot conflict
    puts 'checking the server power conflicts...'
    ok = false
    begin
      server.boot
    rescue Saclient::Cloud::Errors::HttpConflictException
      ok = true
    end
    fail 'サーバ起動中の起動試行時は HttpConflictException がスローされなければなりません' unless ok
    
    # stop
    sleep 3
    puts 'stopping the server...'
    server.stop
    fail 'サーバが正常に停止しません' unless server.sleep_until_down
    
    # disconnect the disk from the server
    puts 'disconnecting the disk from the server...'
    disk.disconnect
    
    # delete the server
    puts 'deleting the server...'
    server.destroy
    
    # duplicate the disk
    puts 'duplicating the disk (expanding to 40GiB)...'
    disk2 = @api.disk.create
    disk2.name = name + "-copy"
    disk2.description = description
    disk2.tags = [tag]
    disk2.source = disk
    disk2.size_gib = 40
    disk2.save
    
    # wait disk duplication
    puts 'waiting disk duplication...'
    fail 'ディスクの複製がタイムアウトしました' unless disk2.sleep_while_copying
    disk2.source = nil
    disk2.reload
    expect(disk2.source).to be_an_instance_of Saclient::Cloud::Resource::Disk
    expect(disk2.source.id).to eq disk.id
    expect(disk2.size_gib).to eq 40
    
    # delete the disks
    puts 'deleting the disks...'
    disk2.destroy
    disk.destroy
    
  end
  
  
  
  after do
    @config = nil
    @api = nil
  end
  
  
  
end
