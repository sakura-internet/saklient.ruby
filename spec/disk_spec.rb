$: << File.dirname(__dir__) + '/lib'
require 'saclient/cloud/api'
require 'date'
require 'SecureRandom'

describe 'Disk' do
  
  
  
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
  
  
  
  it 'should be CRUDed' do
    
    puts 'searching archives...'
    archives = @api.archive.with_name_like('CentOS 6.5 64bit').with_size_gib(20).with_shared_scope.limit(1).find
    # printf "found %d archive(s)\n", archives.length
    archive = archives[0]
    # p archive.dump
    
    puts 'creating disk...'
    disk = @api.disk.create
    disk.name = '!ruby_rspec-' + DateTime.now.strftime('%Y%m%d_%H%M%S') + '-' + SecureRandom.uuid[0, 8]
    disk.description = 'This instance was created by saclient.ruby rspec'
    disk.tags = ['saclient-test']
    disk.copy_from(archive)
    disk.save
    # p disk.dump
    
    puts 'waiting disk copy...'
    fail 'アーカイブからディスクへのコピーがタイムアウトしました' unless disk.sleep_while_copying
    # p disk.dump
    
    disk.destroy
    
  end
  
  
  
  after do
    @config = nil
    @api = nil
  end
  
  
  
end
