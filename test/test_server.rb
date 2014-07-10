$: << File.dirname(__dir__) + '/lib'
require 'minitest/unit'
require 'minitest/autorun'
require 'saclient/cloud/api'
require 'date'
require 'SecureRandom'



class TestServer < MiniTest::Unit::TestCase
  
  
  
  def setup
    
    # load config file
    root = File.dirname(__dir__)
    test_ok_file = root + '/testok';
    assert File.exist?(test_ok_file), test_ok_file+" is not found (You must 'touch' this file to confirm that the tests can make your expenses)"
    config_file = root + '/config.sh'
    assert File.exist?(config_file), test_ok_file+" is not found (Read README.md)"
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
    assert @config[:SACLOUD_TOKEN], 'SACLOUD_TOKEN must be defined in config.sh'
    assert @config[:SACLOUD_SECRET], 'SACLOUD_SECRET must be defined in config.sh'
    #assert @config[:SACLOUD_ZONE], 'SACLOUD_ZONE must be defined in config.sh'
    
    # authorize
    @api = Saclient::Cloud::API::authorize(@config[:SACLOUD_TOKEN], @config[:SACLOUD_SECRET])
    @api = @api.inZone(@config[:SACLOUD_ZONE]) if @config[:SACLOUD_ZONE]
    assert_instance_of Saclient::Cloud::API, @api
    
  end
  
  
  
  def test_find
    
    servers = @api.server.find
    assert_instance_of Array, servers
    assert 1 <= servers.length
    
    servers.each {|server|
      assert_instance_of Saclient::Cloud::Resource::Server, server
      assert_instance_of Saclient::Cloud::Resource::ServerPlan, server.plan
      assert 1 <= server.plan.cpu
      assert 1 <= server.plan.memory_mib
      assert 1 <= server.plan.memory_gib
      assert server.plan.memory_mib / server.plan.memory_gib == 1024
      assert_instance_of Array, server.tags
      server.tags.each {|tag|
        assert_instance_of String, tag
      }
    }
    
  end
  
  
  
  def test_create
    name = '!ruby_minitest-' + DateTime.now.strftime('%Y%m%d_%H%M%S') + '-' + SecureRandom.uuid[0, 8]
    description = 'This instance was created by saclient.ruby minitest'
    tag = 'saclient-test'
    cpu = 1
    mem = 2
    #
    server = @api.server.create
    assert_instance_of Saclient::Cloud::Resource::Server, server
    server.name = name
    server.description = description
    server.tags = [tag]
    server.plan = @api.product.server.get_by_spec(cpu, mem)
    server.save
    #
    assert 1 <= server.id.to_i
    assert server.name == name
    assert server.description == description
    assert_instance_of Array, server.tags
    assert server.tags.length == 1
    assert server.tags[0] == tag
    assert server.plan.cpu == cpu
    assert server.plan.memory_gib == mem
    
    # test_boot
    server.boot
    
    # test_boot_conflict
    begin
      server.boot
    rescue
    end
    
    # test_stop
    server.stop
    
    # test_destroy
    server.destroy
    
    
  end
  
  
  
  def teardown
    @config = nil
    @api = nil
  end
  
  
  
end
