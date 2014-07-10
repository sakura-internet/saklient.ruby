$: << File.dirname(__dir__) + '/lib'
require 'saclient/cloud/api'
require 'date'
require 'SecureRandom'

describe 'Server' do
  
  
  
  before do
    
    # load config file
    root = File.dirname(__dir__)
    test_ok_file = root + '/testok';
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
  
  
  
  it 'should be created, booted and stopped' do
    name = '!ruby_rspec-' + DateTime.now.strftime('%Y%m%d_%H%M%S') + '-' + SecureRandom.uuid[0, 8]
    description = 'This instance was created by saclient.ruby rspec'
    tag = 'saclient-test'
    cpu = 1
    mem = 2
    #
    server = @api.server.create
    expect(server).to be_an_instance_of Saclient::Cloud::Resource::Server
    server.name = name
    server.description = description
    server.tags = [tag]
    server.plan = @api.product.server.get_by_spec(cpu, mem)
    server.save
    #
    expect(server.id.to_i).to be >= 1
    expect(server.name).to eq name
    expect(server.description).to eq description
    expect(server.tags).to be_an_instance_of Array
    expect(server.tags.length).to eq 1
    expect(server.tags[0]).to eq tag
    expect(server.plan.cpu).to eq cpu
    expect(server.plan.memory_gib).to eq mem
    
    # test_boot
    server.boot
    
    # test_boot_conflict
    ok = false
    begin
      server.boot
    rescue Saclient::Cloud::Errors::HttpConflictException
      ok = true
    end
    
    fail 'サーバ起動中の起動試行時は HttpConflictException がスローされなければなりません' unless ok
    
    # test_stop
    server.stop
    
    # test_destroy
    server.destroy
    
  end
  
  
  
  after do
    @config = nil
    @api = nil
  end
  
  
  
end
