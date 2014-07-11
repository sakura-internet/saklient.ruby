$: << File.dirname(__dir__) + '/lib'
require 'saclient/cloud/enums/eserver_instance_status'

EServerInstanceStatus = Saclient::Cloud::Enums::EServerInstanceStatus

describe 'Enum' do
  
  it 'should be defined' do
    expect(EServerInstanceStatus::up).to eq 'up'
    expect(EServerInstanceStatus::down).to eq 'down'
  end
  
  it 'should be compared' do
    expect(EServerInstanceStatus::compare('up', 'up')).to eq 0
    expect(EServerInstanceStatus::compare('up', 'down')).to eq 1
    expect(EServerInstanceStatus::compare('down', 'up')).to eq -1
    expect(EServerInstanceStatus::compare('UNDEFINED-SYMBOL', 'up')).to be_nil
    expect(EServerInstanceStatus::compare('up', 'UNDEFINED-SYMBOL')).to be_nil
    expect(EServerInstanceStatus::compare(nil, 'up')).to be_nil
    expect(EServerInstanceStatus::compare('up', nil)).to be_nil
    expect(EServerInstanceStatus::compare(nil, nil)).to be_nil
  end
  
end
