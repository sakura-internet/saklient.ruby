$: << File.dirname(__dir__) + '/lib'
require 'saclient/cloud/errors/exception_factory'

ExceptionFactory = Saclient::Errors::ExceptionFactory
HttpException = Saclient::Errors::HttpException
HttpNotFoundException = Saclient::Errors::HttpNotFoundException
ServerPowerMustBeUpException = Saclient::Cloud::Errors::ServerPowerMustBeUpException

describe 'Exception' do
  
  it 'should be created' do
    
    x = ExceptionFactory.create(404)
    expect(x).to be_an_instance_of HttpNotFoundException
    
    x = ExceptionFactory.create(409, 'server_power_must_be_up')
    expect(x).to be_an_instance_of ServerPowerMustBeUpException
    
    x = ExceptionFactory.create(666, 'nameless_http_error', 'Ia! Cthulhu Fthagn!')
    expect(x).to be_an_instance_of HttpException
    expect(x.message).to eq 'Ia! Cthulhu Fthagn!'
    
 	end
  
end
