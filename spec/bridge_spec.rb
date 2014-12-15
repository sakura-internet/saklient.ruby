$: << File.dirname(__dir__) + '/lib'
require 'saklient/cloud/api'
require 'date'
require 'SecureRandom'

describe 'Bridge' do
  
  
  
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
    puts 'リージョンを検索しています...'
    regions = @api.facility.region.with_name_like('石狩').find
    for region in regions do
      expect(region).to be_an_instance_of Saklient::Cloud::Resources::Region
    end
    
    puts 'ブリッジを作成しています...'
    bridge = @api.bridge.create
    bridge.name = name
    bridge.description = description
    bridge.region = regions[0]
    bridge.save
    expect(bridge).to be_an_instance_of Saklient::Cloud::Resources::Bridge
    
    puts 'スイッチを作成しています...'
    swytch = @api.swytch.create
    swytch.name = name
    swytch.description = description
    swytch.save
    expect(swytch).to be_an_instance_of Saklient::Cloud::Resources::Swytch
    
    puts 'スイッチをブリッジに接続しています...'
    swytch.connect_to_bridge(bridge)
    
    puts 'スイッチをブリッジから切断しています...'
    swytch.disconnect_from_bridge
    
    puts 'スイッチを削除しています...'
    swytch.destroy
    
    puts 'ブリッジを削除しています...'
    bridge.destroy
    
  end
  
  
  
  after do
    @config = nil
    @api = nil
  end
  
  
  
end
