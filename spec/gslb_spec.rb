$: << File.dirname(__dir__) + '/lib'
require 'saklient/cloud/api'
require 'date'
require 'SecureRandom'

describe 'GSLB' do
  
  
  
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
  
    #
    puts 'GSLBを作成しています...'
    gslb = @api.common_service_item.create_gslb("http", 10, true)
    expect(gslb).to be_an_instance_of Saklient::Cloud::Resources::Gslb
    gslb.path_to_check = '/index.html'
    gslb.response_expected = 200
    gslb.name = name
    gslb.description = 'This is a test'
    gslb.save
    id = gslb.id.to_i
    expect(id).to be > 0
    expect(gslb.name).to eq name 
    expect(gslb.servers.length).to eq 0
    
    gslb = @api.common_service_item.get_by_id(id)
    expect(gslb.id.to_i).to eq id 
    expect(gslb.path_to_check).to eq '/index.html'
    expect(gslb.response_expected).to eq 200
    expect(gslb.name).to eq name 
    expect(gslb.servers.length).to eq 0
    
    server = gslb.add_server
    server.enabled = true
    server.weight = 10
    server.ip_address = "49.212.82.90"
    gslb.save
    expect(gslb.servers.length).to eq 1

    gslb = @api.common_service_item.get_by_id(id)
    expect(gslb.servers.length).to eq 1
    
    puts 'GSLBを削除しています...'
    gslb.destroy
    
    ok = false
    begin
      gslb = @api.common_service_item.get_by_id(id)
    rescue Saklient::Errors::HttpNotFoundException
      ok = true
    end
    fail 'GSLBが正しく削除されていません' unless ok
    
  end
  
  
  
  after do
    @config = nil
    @api = nil
  end
  
  
  
end
