$: << File.dirname(__dir__) + '/lib'
require 'saklient/cloud/api'
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
    @api = Saklient::Cloud::API::authorize(@config[:SACLOUD_TOKEN], @config[:SACLOUD_SECRET])
    @api = @api.in_zone(@config[:SACLOUD_ZONE]) if @config[:SACLOUD_ZONE]
    expect(@api).to be_an_instance_of Saklient::Cloud::API
    
  end
  
  
  
  it 'should be found' do
    
    servers = @api.server.sort_by_memory.find
    expect(servers).to be_an_instance_of Array
    expect(servers.length).to be > 0
    
    mem = 0
    servers.each {|server|
      expect(server).to be_an_instance_of Saklient::Cloud::Resource::Server
      expect(server.plan).to be_an_instance_of Saklient::Cloud::Resource::ServerPlan
      expect(server.plan.cpu).to be > 0
      expect(server.plan.memory_mib).to be > 0
      expect(server.plan.memory_gib).to be > 0
      expect(server.plan.memory_mib / server.plan.memory_gib).to eq 1024
      expect(server.tags).to be_an_instance_of Array
      server.tags.each {|tag|
        expect(tag).to be_an_instance_of String
      }
      expect(server.plan.memory_gib).to be >= mem
      mem = server.plan.memory_gib
    }
    
  end
  
  
  
  it 'should be CRUDed' do
    name = '!ruby_rspec-' + DateTime.now.strftime('%Y%m%d_%H%M%S') + '-' + SecureRandom.uuid[0, 8]
    description = 'This instance was created by saklient.ruby rspec'
    tag = 'saklient-test'
    cpu = 1
    mem = 2
    host_name = 'saklient-test'
    ssh_public_key = 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3sSg8Vfxrs3eFTx3G//wMRlgqmFGxh5Ia8DZSSf2YrkZGqKbL1t2AsiUtIMwxGiEVVBc0K89lORzra7qoHQj5v5Xlcdqodgcs9nwuSeS38XWO6tXNF4a8LvKnfGS55+uzmBmVUwAztr3TIJR5TTWxZXpcxSsSEHx7nIcr31zcvosjgdxqvSokAsIgJyPQyxCxsPK8SFIsUV+aATqBCWNyp+R1jECPkd74ipEBoccnA0pYZnRhIsKNWR9phBRXIVd5jx/gK5jHqouhFWvCucUs0gwilEGwpng3b/YxrinNskpfOpMhOD9zjNU58OCoMS8MA17yqoZv59l3u16CrnrD saklient-test@local'
    ssh_private_key_file = File.dirname(__dir__) + '/test-sshkey.txt'
    
    # search archives
    puts 'searching archives...'
    archives = @api.archive.with_name_like('CentOS 6.5 64bit').with_size_gib(20).with_shared_scope.limit(1).find
    # printf "found %d archive(s)\n", archives.length
    archive = archives[0]
    # p archive.dump
    
    # search scripts
    puts 'searching scripts...'
    scripts = @api.script.with_name_like('WordPress').with_shared_scope.limit(1).find
    # printf "found %d script(s)\n", scripts.length
    script = scripts[0]
    # p script.dump
    
    # create a disk
    puts 'creating a disk...'
    disk = @api.disk.create
    ok = false
    begin
      disk.save
    rescue Saklient::Errors::SaklientException
      ok = true
    end
    fail 'Requiredフィールドが未set時は SaklientException がスローされなければなりません' unless ok
    disk.name = '!ruby_rspec-' + DateTime.now.strftime('%Y%m%d_%H%M%S') + '-' + SecureRandom.uuid[0, 8]
    disk.description = 'This instance was created by saklient.ruby rspec'
    disk.tags = ['saklient-test']
    disk.plan = @api.product.disk.ssd
    disk.source = archive
    disk.save
    # p disk.dump
    
    # check an immutable field
    puts 'updating the disk...'
    ok = false
    begin
      disk.size_mib = 20480
      disk.save
    rescue Saklient::Errors::SaklientException
      ok = true
    end
    fail 'Immutableフィールドの再set時は SaklientException がスローされなければなりません' unless ok
    
    # create a server
    puts 'creating a server...'
    server = @api.server.create
    expect(server).to be_an_instance_of Saklient::Cloud::Resource::Server
    server.name = name
    server.description = description
    server.tags = [tag]
    server.plan = @api.product.server.get_by_spec(cpu, mem)
    server.save
    
    # check the server properties
    expect(server.id.to_i).to be > 0
    expect(server.name).to eq name
    expect(server.description).to eq description
    expect(server.tags).to be_an_instance_of Array
    expect(server.tags.length).to eq 1
    expect(server.tags[0]).to eq tag
    expect(server.plan.cpu).to eq cpu
    expect(server.plan.memory_gib).to eq mem
    
    # connect to shared segment
    puts 'connecting the server to shared segment...'
    iface = server.add_iface
    expect(iface).to be_an_instance_of Saklient::Cloud::Resource::Iface
    expect(iface.id.to_i).to be > 0
    iface.connect_to_shared_segment
    
    # wait disk copy
    puts 'waiting disk copy...'
    fail 'アーカイブからディスクへのコピーがタイムアウトしました' unless disk.sleep_while_copying
    # p disk.dump
    disk.source = nil
    disk.reload
    expect(disk.source).to be_an_instance_of Saklient::Cloud::Resource::Archive
    expect(disk.source.id).to eq archive.id
    expect(disk.size_gib).to eq archive.size_gib
    
    # connect the disk to the server
    puts 'connecting the disk to the server...'
    disk.connect_to(server)
    
    # config the disk
    puts 'writing configuration to the disk...'
    diskconf = disk.create_config
    diskconf.host_name = 'saklient-test'
    diskconf.password = SecureRandom.uuid[0, 8]
    diskconf.ssh_key = ssh_public_key
    diskconf.scripts.push(script)
    diskconf.write
    
    # boot
    puts 'booting the server...'
    server.boot
    sleep 3
    server.reload
    expect(server.instance.status).to eq Saklient::Cloud::Enums::EServerInstanceStatus::up
    
    # boot conflict
    puts 'checking the server power conflicts...'
    ok = false
    begin
      server.boot
    rescue Saklient::Errors::HttpConflictException
      ok = true
    end
    fail 'サーバ起動中の起動試行時は HttpConflictException がスローされなければなりません' unless ok
    
    # ssh
    ip_address = server.ifaces[0].ip_address
    expect(ip_address).not_to be_empty
    cmd = '| ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -i' + ssh_private_key_file +
          ' root@' + ip_address + ' hostname 2>/dev/null'
    ssh_success = false
    puts 'trying to SSH to the server...'
    for i in 0..9 do
      sleep 5
      sh = open cmd
      host_name_got = ''
      while !sh.eof
        host_name_got += sh.gets
      end
      sh.close
      host_name_got.strip!
      next unless host_name == host_name_got
      ssh_success = true
      break
    end
    fail '作成したサーバへ正常にSSHできません' unless ssh_success
    
    # stop
    sleep 1
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
    disk2.plan = @api.product.disk.hdd
    disk2.source = disk
    disk2.size_gib = 40
    disk2.save
    
    # wait disk duplication
    puts 'waiting disk duplication...'
    fail 'ディスクの複製がタイムアウトしました' unless disk2.sleep_while_copying
    disk2.source = nil
    disk2.reload
    expect(disk2.source).to be_an_instance_of Saklient::Cloud::Resource::Disk
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
