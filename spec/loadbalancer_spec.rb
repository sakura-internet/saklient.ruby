$: << File.dirname(__dir__) + '/lib'
require 'saklient/version'
require 'saklient/cloud/api'
require 'date'
require 'SecureRandom'
require 'ipaddr'

describe 'LoadBalancer' do
  
  
	
  TESTS_CONFIG_READYMADE_LB_ID = nil
  
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
  
  
  
  it 'should be CRUDed' do
    name = '!ruby_rspec-' + DateTime.now.strftime('%Y%m%d_%H%M%S') + '-' + SecureRandom.uuid[0, 8]
    description = 'This instance was created by saklient.ruby rspec'
    tag = 'saklient-test'
    
    puts 'Saklient::VERSION = ' + Saklient::VERSION.to_s
    
    
    
    # create a LB
    if ! TESTS_CONFIG_READYMADE_LB_ID then
      
      # search a switch
      puts 'searching a swytch...'
      swytches = @api.swytch.with_name_like('saklient-lb-attached').limit(1).find
      if 0 < swytches.length
        swytch = swytches[0]
      else
        puts 'ルータ＋スイッチを作成しています...'
        router = @api.router.create
        router.name = 'saklient-lb-attached'
        router.band_width_mbps = 100
        router.network_mask_len = 28
        router.save
        puts 'ルータ＋スイッチの作成完了を待機しています...'
        fail 'ルータが正常に作成されません' if !router.sleep_while_creating
        swytch = router.get_swytch
      end
      expect(swytch).to be_an_instance_of Saklient::Cloud::Resources::Swytch
      expect(swytch.ipv4_nets.length).to be > 0
      net = swytch.ipv4_nets[0]
      printf "%s/%d -> %s\n", net.address, net.mask_len, net.default_route
      
      # create a loadbalancer
      puts 'creating a LB...'
      vrid = 123
      real_ip1 = IPAddr.new(IPAddr.new(net.default_route).to_i + 3, Socket::AF_INET).to_s
      real_ip2 = IPAddr.new(IPAddr.new(net.default_route).to_i + 4, Socket::AF_INET).to_s
      lb = @api.appliance.create_load_balancer(swytch, vrid, [real_ip1, real_ip2], true)
      
      ok = false
      begin
        lb.save()
      rescue Saklient::Errors::SaklientException
        ok = true
      end
      fail 'Requiredフィールドが未set時は SaklientException がスローされなければなりません' unless ok
      lb.name = name
      lb.description = ''
      lb.tags = [tag]
      lb.save
      
      lb.reload
      expect(lb.default_route).to eq net.default_route
      expect(lb.mask_len).to eq net.mask_len
      expect(lb.vrid).to eq vrid
      expect(lb.swytch_id).to eq swytch.id
      
      # wait the LB becomes up
      puts 'waiting the LB becomes up...'
      fail 'ロードバランサが正常に起動しません' unless lb.sleep_until_up
      
    else
      
      lb = @api.appliance.get_by_id(TESTS_CONFIG_READYMADE_LB_ID)
      expect(lb).to be_an_instance_of Saklient::Cloud::Resources::LoadBalancer
      swytch = lb.get_swytch
      expect(swytch).to be_an_instance_of Saklient::Cloud::Resources::Swytch
      net = swytch.ipv4_nets[0]
      expect(net).to be_an_instance_of Saklient::Cloud::Resources::Ipv4Net
      printf "%s/%d -> %s\n", net.address, net.mask_len, net.default_route
      
    end
    
    
    
    # clear virtual ips
    
    lb.clear_virtual_ips
    lb.save
    lb.reload
    expect(lb.virtual_ips.length).to eq 0
    
    
    
    # setting virtual ips test 1
    
    vip1Ip     = IPAddr.new(IPAddr.new(net.default_route).to_i + 5, Socket::AF_INET).to_s
    vip1SrvIp1 = IPAddr.new(IPAddr.new(net.default_route).to_i + 6, Socket::AF_INET).to_s
    vip1SrvIp2 = IPAddr.new(IPAddr.new(net.default_route).to_i + 7, Socket::AF_INET).to_s
    vip1SrvIp3 = IPAddr.new(IPAddr.new(net.default_route).to_i + 8, Socket::AF_INET).to_s
    vip1SrvIp4 = IPAddr.new(IPAddr.new(net.default_route).to_i + 9, Socket::AF_INET).to_s
    
    lb.add_virtual_ip({
      :vip => vip1Ip,
      :port => 80,
      :delay => 15,
      :servers => [
        { :ip=>vip1SrvIp1, :port=>80, :protocol=>'http', :path_to_check=>'/index.html', :response_expected=>200 },
        { :ip=>vip1SrvIp2, :port=>80, :protocol=>'https', :path_to_check=>'/', :response_expected=>200 },
        { :ip=>vip1SrvIp3, :port=>80, :protocol=>'tcp' }
      ]
    })
    
    vip2Ip     = IPAddr.new(IPAddr.new(net.default_route).to_i + 10, Socket::AF_INET).to_s
    vip2SrvIp1 = IPAddr.new(IPAddr.new(net.default_route).to_i + 11, Socket::AF_INET).to_s
    vip2SrvIp2 = IPAddr.new(IPAddr.new(net.default_route).to_i + 12, Socket::AF_INET).to_s
    vip2SrvIp3 = IPAddr.new(IPAddr.new(net.default_route).to_i + 13, Socket::AF_INET).to_s
    
    vip2 = lb.add_virtual_ip
    vip2.virtual_ip_address = vip2Ip
    vip2.port = 80
    vip2.delay_loop = 15
    vip2.sorry_server = vip2SrvIp3
    vip2Srv1 = vip2.add_server
    vip2Srv1.enabled = true
    vip2Srv1.ip_address = vip2SrvIp1
    vip2Srv1.port = 80
    vip2Srv1.protocol = 'http'
    vip2Srv1.path_to_check = '/index.html'
    vip2Srv1.response_expected = 200
    vip2Srv2 = vip2.add_server
    vip2Srv2.enabled = false
    vip2Srv2.ip_address = vip2SrvIp2
    vip2Srv2.port = 80
    vip2Srv2.protocol = 'tcp'
    lb.save
    lb.reload
    
    expect(lb.virtual_ips.length).to eq 2
    expect(lb.virtual_ips[0].virtual_ip_address).to eq vip1Ip
    expect(lb.virtual_ips[0].sorry_server).to be_nil
    expect(lb.virtual_ips[0].servers.length).to eq 3
    expect(lb.virtual_ips[0].servers[0].enabled).to be_nil
    expect(lb.virtual_ips[0].servers[0].ip_address).to eq vip1SrvIp1
    expect(lb.virtual_ips[0].servers[0].port).to eq 80
    expect(lb.virtual_ips[0].servers[0].protocol).to eq 'http'
    expect(lb.virtual_ips[0].servers[0].path_to_check).to eq '/index.html'
    expect(lb.virtual_ips[0].servers[0].response_expected).to eq 200
    expect(lb.virtual_ips[0].servers[1].ip_address).to eq vip1SrvIp2
    expect(lb.virtual_ips[0].servers[1].port).to eq 80
    expect(lb.virtual_ips[0].servers[1].protocol).to eq 'https'
    expect(lb.virtual_ips[0].servers[1].path_to_check).to eq '/'
    expect(lb.virtual_ips[0].servers[1].response_expected).to eq 200
    expect(lb.virtual_ips[0].servers[2].ip_address).to eq vip1SrvIp3
    expect(lb.virtual_ips[0].servers[2].port).to eq 80
    expect(lb.virtual_ips[0].servers[2].protocol).to eq 'tcp'
    expect(lb.virtual_ips[1].virtual_ip_address).to eq vip2Ip
    expect(lb.virtual_ips[1].sorry_server).to eq vip2SrvIp3
    expect(lb.virtual_ips[1].servers.length).to eq 2
    expect(lb.virtual_ips[1].servers[0].enabled).to be_truthy
    expect(lb.virtual_ips[1].servers[0].ip_address).to eq vip2SrvIp1
    expect(lb.virtual_ips[1].servers[0].port).to eq 80
    expect(lb.virtual_ips[1].servers[0].protocol).to eq 'http'
    expect(lb.virtual_ips[1].servers[0].path_to_check).to eq '/index.html'
    expect(lb.virtual_ips[1].servers[0].response_expected).to eq 200
    expect(lb.virtual_ips[1].servers[1].enabled).to be_falsy
    expect(lb.virtual_ips[1].servers[1].ip_address).to eq vip2SrvIp2
    expect(lb.virtual_ips[1].servers[1].port).to eq 80
    expect(lb.virtual_ips[1].servers[1].protocol).to eq 'tcp'
    
    
    
    # setting virtual ips test 2
    
    lb.get_virtual_ip_by_address(vip1Ip).add_server({
      :ip => vip1SrvIp4,
      :port => 80,
      :protocol => 'ping'
    })
    lb.save
    lb.reload
    
    expect(lb.virtual_ips.length).to eq 2
    expect(lb.virtual_ips[0].sorry_server).to be_nil
    expect(lb.virtual_ips[0].servers.length).to eq 4
    expect(lb.virtual_ips[0].servers[3].ip_address).to eq vip1SrvIp4
    expect(lb.virtual_ips[0].servers[3].port).to eq 80
    expect(lb.virtual_ips[0].servers[3].protocol).to eq 'ping'
    expect(lb.virtual_ips[1].sorry_server).to eq vip2SrvIp3
    expect(lb.virtual_ips[1].servers.length).to eq 2
    
    
    
    # checking status
    
    lb.reload_status
    for vip in lb.virtual_ips do
      printf "  vip %s:%s every %ssec(s)\n", vip.virtual_ip_address, vip.port, vip.delay_loop
      for server in vip.servers do
        printf '    [%s(%s)]', server.status, server.active_connections
        printf ' server %s://%s', server.protocol, server.ip_address
        printf ':%d', server.port if server.port
        print server.path_to_check if server.path_to_check
        print ' answers'
        printf ' %d', server.response_expected if server.response_expected
        print "\n"
        # expect(server.status).to eq 'down'
      end
    end
    
    
    
    # delete the LB
    if ! TESTS_CONFIG_READYMADE_LB_ID then
      
      # stop the LB
      sleep 1
      puts 'stopping the LB...'
      fail 'ロードバランサが正常に停止しません' unless lb.stop.sleep_until_down
      
      # delete the LB
      puts 'deleting the LB...'
      lb.destroy
      
    end
    
  end
  
  
  
  after do
    @config = nil
    @api = nil
  end
  
  
  
end
