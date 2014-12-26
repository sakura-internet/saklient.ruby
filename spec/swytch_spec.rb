$: << File.dirname(__dir__) + '/lib'
require 'saklient/cloud/api'
require 'date'
require 'SecureRandom'
require 'ipaddr'

describe 'Swytch' do
  
  
  
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
  
    #
    puts 'ルータ＋スイッチを作成しています...'
    swytch = @api.swytch.create
    swytch.name = name
    swytch.description = description
    swytch.save
    expect(swytch).to be_an_instance_of Saklient::Cloud::Resources::Swytch
        
    #
    puts 'サーバを作成しています...'
    server = @api.server.create
    expect(server).to be_an_instance_of Saklient::Cloud::Resources::Server
    server.name = name
    server.description = description
    server.plan = @api.product.server.get_by_spec(1, 1)
    server.save
    expect(server.id.to_i).to be > 0
    
    #
    puts 'インタフェースを増設しています...'
    iface = server.add_iface()
    expect(iface).to be_an_instance_of Saklient::Cloud::Resources::Iface
    expect(iface.id.to_i).to be > 0
    
    #
    puts 'インタフェースをスイッチに接続しています...'
    iface.connect_to_swytch(swytch)
    
    #
    puts 'インタフェースをスイッチから切断しています...'
    iface.disconnect_from_swytch
    
    #
    puts 'サーバを削除しています...'
    server.destroy
    
    #
    puts 'スイッチを削除しています...'
    swytch.destroy
    
  end
  
  
  
  after do
    @config = nil
    @api = nil
  end
  
  
  
end
