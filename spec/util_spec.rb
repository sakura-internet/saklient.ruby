$: << File.dirname(__dir__) + '/lib'
require 'saklient/util'
require 'saklient/cloud/api'

Util = Saklient::Util

describe 'Util' do
  
  it 'should access objects by path' do
    test = {}
    Util::set_by_path(test, 'top', 123)
    expect(test[:top]).to eq 123
    Util::set_by_path(test, 'first.second', 456)
    expect(test[:first][:second]).to eq 456
    Util::set_by_path(test, '.weird..path', 789)
    expect(test[:weird][:path]).to eq 789
    Util::set_by_path(test, 'existing.nil', nil)
    expect(Util::get_by_path(test, 'existing')).to be_a Object
    expect(Util::get_by_path(test, 'existing.nil')).to be_nil
    #
    expect(Util::get_by_path(test, 'top')).to eq 123
    expect(Util::get_by_path(test, 'first.second')).to eq 456
    expect(Util::get_by_path(test, '.weird..path')).to eq 789
    #
    expect(Util::get_by_path(test, 'nothing')).to be_nil
    expect(Util::get_by_path(test, 'nothing.child')).to be_nil
    expect(Util::get_by_path(test, 'top.child')).to be_nil
    #
    expect(Util::exists_path(test, 'top')).to be true
    expect(Util::exists_path(test, 'top.child')).to be false
    expect(Util::exists_path(test, 'first.second')).to be true
    expect(Util::exists_path(test, '.weird..path')).to be true
    expect(Util::exists_path(test, 'nothing')).to be false
    expect(Util::exists_path(test, 'nothing.child')).to be false
    expect(Util::exists_path(test, 'existing')).to be true
    expect(Util::exists_path(test, 'existing.nil')).to be true
    #
    test[:first][:second] *= 10
    expect(Util::get_by_path(test, 'first.second')).to eq 4560
    
    #
    Util::validate_type(1, 'Fixnum')
    Util::validate_type(1, 'Float')
    Util::validate_type(1, 'String')
    Util::validate_type(1.1, 'Float')
    Util::validate_type(1.1, 'String')
    ex = Saklient::Errors::SaklientException.new('a','a')
    Util::validate_type(ex, 'Saklient::Errors::SaklientException')
    Util::validate_type(ex, 'StandardError')
    
    #
    ok = false
    begin
      Saklient::Cloud::API::authorize('abc', [])
    rescue Saklient::Errors::SaklientException
      ok = true
    end
    fail '引数の型が異なる時は SaklientException がスローされなければなりません' unless ok
    
    #
    ok = false
    begin
      server = Saklient::Cloud::API::authorize('a', 'a').server.create
      server.availability = 'available'
    rescue NoMethodError
      ok = true
    end
    fail '未定義または読み取り専用フィールドへのset時は NoMethodError がスローされなければなりません' unless ok
    
    #
    expect(Util::ip2long('0.0.0.0')).to eq 0
    expect(Util::ip2long('127.255.255.255')).to eq 0x7FFFFFFF
    expect(Util::ip2long('128.0.0.0')).to eq 0x80000000
    expect(Util::ip2long('255.255.255.255')).to eq 0xFFFFFFFF
    expect(Util::ip2long('222.173.190.239')).to eq 0xDEADBEEF
    #
    expect(Util::long2ip(0)).to eq '0.0.0.0'
    expect(Util::long2ip(0x7FFFFFFF)).to eq '127.255.255.255'
    expect(Util::long2ip(0x80000000)).to eq '128.0.0.0'
    expect(Util::long2ip(0xFFFFFFFF)).to eq '255.255.255.255'
    expect(Util::long2ip(0xDEADBEEF)).to eq '222.173.190.239'
    expect(Util::long2ip(Util::ip2long('127.255.255.255') + 1)).to eq '128.0.0.0'
    #
    expect(Util::ip2long(nil)).to be_nil
    expect(Util::ip2long(0)).to be_nil
    expect(Util::ip2long('')).to be_nil
    expect(Util::ip2long('x')).to be_nil
    expect(Util::ip2long('0.0.0')).to be_nil
    expect(Util::ip2long('0.0.0.x')).to be_nil
    expect(Util::ip2long('0.0.0.0.0')).to be_nil
    expect(Util::ip2long('255.255.255.256')).to be_nil
    expect(Util::ip2long('256.255.255.255')).to be_nil
    expect(Util::long2ip(nil)).to be_nil
    expect(Util::long2ip('0')).to eq '0.0.0.0'
    expect(Util::long2ip(Util::ip2long('0.0.0.0') - 1)).to eq '255.255.255.255'
    expect(Util::long2ip(Util::ip2long('255.255.255.255') + 1)).to be_nil
    
  end
  
end
