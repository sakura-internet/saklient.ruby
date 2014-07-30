$: << File.dirname(__dir__) + '/lib'
require 'saclient/cloud/api'
require 'date'
require 'SecureRandom'

describe 'IsoImage' do
  
  
  
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
    @api = @api.in_zone(@config[:SACLOUD_ZONE]) if @config[:SACLOUD_ZONE]
    expect(@api).to be_an_instance_of Saclient::Cloud::API
    
  end
  
  
  
  it 'should be inserted and ejected' do
    name = '!ruby_rspec-' + DateTime.now.strftime('%Y%m%d_%H%M%S') + '-' + SecureRandom.uuid[0, 8]
    description = 'This instance was created by saclient.ruby rspec'
    tag = 'saclient-test'
    
    # search iso images
    puts 'searching iso images..'
    isos = @api.iso_image.
      with_name_like('CentOS 6.5 64bit').
      with_shared_scope.
      limit(1).
      find
    expect(isos.length).to be > 0
    iso = isos[0]
    
    # create a server
    puts 'creating a server..'
    server = @api.server.create
    expect(server).to be_an_instance_of Saclient::Cloud::Resource::Server
    server.name = name
    server.description = description
    server.tags = [tag]
    server.plan = @api.product.server.get_by_spec(1, 1)
    server.save
    
    # insert iso image while the server is down
    puts 'inserting an ISO image to the server..'
    server.insert_iso_image(iso)
    expect(server.instance.iso_image).to be_an_instance_of Saclient::Cloud::Resource::IsoImage
    expect(server.instance.iso_image.id).to eq iso.id
    
    # eject iso image while the server is down
    puts 'ejecting the ISO image from the server..'
    server.eject_iso_image
    expect(server.instance.iso_image).to be_nil
    
    # boot
    puts 'booting the server..'
    server.boot
    sleep 3
    
    # insert iso image while the server is up
    puts 'inserting an ISO image to the server..'
    server.insert_iso_image(iso)
    expect(server.instance.iso_image).to be_an_instance_of Saclient::Cloud::Resource::IsoImage
    expect(server.instance.iso_image.id).to eq iso.id
    
    # eject iso image while the server is up
    puts 'ejecting the ISO image from the server..'
    server.eject_iso_image
    expect(server.instance.iso_image).to be_nil
    
    # stop
    sleep 1
    puts 'stopping the server...'
    server.stop
    fail 'サーバが正常に停止しません' unless server.sleep_until_down
    
    # delete the server
    puts 'deleting the server..'
    server.destroy
    
  end
  
  
  
  after do
    @config = nil
    @api = nil
  end
  
  
  
end
