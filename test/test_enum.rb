$: << File.dirname(__dir__) + '/lib'
require 'minitest/unit'
require 'minitest/autorun'
require 'saclient/cloud/enums/eserver_instance_status'
EServerInstanceStatus = Saclient::Cloud::Enums::EServerInstanceStatus

class TestEnum < MiniTest::Unit::TestCase
  
  def test_definition
 		assert_equal('up', EServerInstanceStatus::up);
 		assert_equal('down', EServerInstanceStatus::down);
 	end
 	
  def test_comparison
 		assert_equal(0, EServerInstanceStatus::compare('up', 'up'));
 		assert_equal(1, EServerInstanceStatus::compare('up', 'down'));
 		assert_equal(-1, EServerInstanceStatus::compare('down', 'up'));
 		assert_nil(EServerInstanceStatus::compare('UNDEFINED-SYMBOL', 'up'));
 		assert_nil(EServerInstanceStatus::compare('up', 'UNDEFINED-SYMBOL'));
 		assert_nil(EServerInstanceStatus::compare(nil, 'up'));
 		assert_nil(EServerInstanceStatus::compare('up', nil));
 		assert_nil(EServerInstanceStatus::compare(nil, nil));
  end
  
end
