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
    
  end
  
end
