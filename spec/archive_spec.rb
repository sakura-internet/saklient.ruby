$: << File.dirname(__dir__) + '/lib'
require 'saklient/cloud/api'
require 'date'
require 'SecureRandom'
require 'tempfile'

describe 'Archive' do
  
  
  
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
    
    archive = @api.archive.create
    expect(archive).to be_an_instance_of Saklient::Cloud::Resources::Archive 
    archive.name = name
    archive.description = description
    archive.tags = [tag]
    archive.size_gib = 20
    archive.save
    
    #
    ftp = archive.ftp_info
    expect(ftp).to be_an_instance_of Saklient::Cloud::Resources::FtpInfo 
    expect(ftp.host_name).not_to be_nil
    expect(ftp.user).not_to be_nil
    expect(ftp.password).not_to be_nil
    ftp2 = archive.open_ftp(true).ftp_info
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
    cmd += "put #{path};"
    cmd += "exit"
    cmd = "lftp -u #{ftp2.user},#{ftp2.password} -p 21 -e '#{cmd}' #{ftp2.host_name}"
    puts cmd
    puts `( #{cmd} ) 2>&1`
    cmd = "rm -f #{path}"
    puts cmd
    puts `( #{cmd} ) 2>&1`
    
    archive.close_ftp
    
    #
    archive.destroy
    
  end
  
  
  
  it 'should be copied' do
    name = '!ruby_rspec-' + DateTime.now.strftime('%Y%m%d_%H%M%S') + '-' + SecureRandom.uuid[0, 8]
    description = 'This instance was created by saklient.ruby rspec'
    tag = 'saklient-test'
    
    disk = @api.disk.create
    disk.name = name
    disk.description = description
    disk.tags = [tag]
    disk.size_gib = 20
    disk.plan = @api.product.disk.ssd
    disk.save
    
    archive = @api.archive.create
    archive.name = name
    archive.description = description
    archive.tags = [tag]
    archive.source = disk
    archive.save
    
    fail 'ディスクからアーカイブへのコピーがタイムアウトまたは失敗しました' unless archive.sleep_while_copying
    
    disk.destroy
    
    ftp = archive.open_ftp.ftp_info
    expect(ftp).to be_an_instance_of Saklient::Cloud::Resources::FtpInfo
    expect(ftp.host_name).not_to be_nil
    expect(ftp.user).not_to be_nil
    expect(ftp.password).not_to be_nil
    
    archive.close_ftp
    archive.destroy
  end
  
  
  
  after do
    @config = nil
    @api = nil
  end
  
  
  
end
