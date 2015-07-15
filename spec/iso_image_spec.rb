$: << File.dirname(__dir__) + '/lib'
require 'saklient/cloud/api'
require 'date'
require 'SecureRandom'
require 'tempfile'

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
    @api = Saklient::Cloud::API::authorize(@config[:SACLOUD_TOKEN], @config[:SACLOUD_SECRET])
    @api = @api.in_zone(@config[:SACLOUD_ZONE]) if @config[:SACLOUD_ZONE]
    expect(@api).to be_an_instance_of Saklient::Cloud::API
    
  end
  
  
  
  it 'should be CRUDed' do
    name = '!ruby_rspec-' + DateTime.now.strftime('%Y%m%d_%H%M%S') + '-' + SecureRandom.uuid[0, 8]
    description = 'This instance was created by saklient.ruby rspec'
    tag = 'saklient-test'
    
    iso = @api.iso_image.create
    expect(iso).to be_an_instance_of Saklient::Cloud::Resources::IsoImage
    iso.name = name
    iso.description = description
    iso.tags = [tag]
    iso.size_mib = 5120
    iso.save
    
    #
    ftp = iso.ftp_info
    expect(ftp).to be_an_instance_of Saklient::Cloud::Resources::FtpInfo
    expect(ftp.host_name).not_to be_nil
    expect(ftp.user).not_to be_nil
    expect(ftp.password).not_to be_nil
    ftp2 = iso.open_ftp(true).ftp_info
    expect(ftp2).to be_an_instance_of Saklient::Cloud::Resources::FtpInfo
    expect(ftp2.host_name).not_to be_nil
    expect(ftp2.user).not_to be_nil
    expect(ftp2.password).not_to be_nil
    expect(ftp2.password).not_to eq ftp.password
    
    #
    temp = Tempfile.new('saklient-')
    path = temp.path
    temp.close!
    cmd = "dd if=/dev/urandom bs=4096 count=64 > #{path}; ls -l #{path}"
    puts cmd
    puts `( #{cmd} ) 2>&1`
    cmd  = "set ftp:ssl-allow true;"
    cmd += "set ftp:ssl-force true;"
    cmd += "set ftp:ssl-protect-data true;"
    cmd += "set ftp:ssl-protect-list true;"
    cmd += "set ssl:verify-certificate no;"
    cmd += "put #{path};"
    cmd += "exit"
    cmd = "lftp -u #{ftp2.user},#{ftp2.password} -p 21 -e '#{cmd}' #{ftp2.host_name}"
    puts cmd
    puts `( #{cmd} ) 2>&1`
    cmd = "rm -f #{path}"
    puts cmd
    puts `( #{cmd} ) 2>&1`
    
    iso.close_ftp
    
    #
    iso.destroy
    
  end
  
  
  
  it 'should be inserted and ejected' do
    name = '!ruby_rspec-' + DateTime.now.strftime('%Y%m%d_%H%M%S') + '-' + SecureRandom.uuid[0, 8]
    description = 'This instance was created by saklient.ruby rspec'
    tag = 'saklient-test'
    
    # search iso images
    puts 'searching iso images...'
    isos = @api.iso_image.
      with_name_like('CentOS 64bit').
      with_shared_scope.
      limit(1).
      find
    expect(isos.length).to be > 0
    iso = isos[0]
    
    # create a server
    puts 'creating a server...'
    server = @api.server.create
    expect(server).to be_an_instance_of Saklient::Cloud::Resources::Server
    server.name = name
    server.description = description
    server.tags = [tag]
    server.plan = @api.product.server.get_by_spec(1, 1)
    server.save
    
    # insert iso image while the server is down
    puts 'inserting an ISO image to the server...'
    server.insert_iso_image(iso)
    expect(server.instance.iso_image).to be_an_instance_of Saklient::Cloud::Resources::IsoImage
    expect(server.instance.iso_image.id).to eq iso.id
    
    # eject iso image while the server is down
    puts 'ejecting the ISO image from the server...'
    server.eject_iso_image
    expect(server.instance.iso_image).to be_nil
    
    # boot
    puts 'booting the server...'
    server.boot
    sleep 3
    
    # insert iso image while the server is up
    puts 'inserting an ISO image to the server...'
    server.insert_iso_image(iso)
    expect(server.instance.iso_image).to be_an_instance_of Saklient::Cloud::Resources::IsoImage
    expect(server.instance.iso_image.id).to eq iso.id
    
    # eject iso image while the server is up
    puts 'ejecting the ISO image from the server...'
    server.eject_iso_image
    expect(server.instance.iso_image).to be_nil
    
    # stop
    sleep 1
    puts 'stopping the server...'
    server.stop
    fail 'サーバが正常に停止しません' unless server.sleep_until_down
    
    # delete the server
    puts 'deleting the server...'
    server.destroy
    
  end
  
  
  
  after do
    @config = nil
    @api = nil
  end
  
  
  
end
