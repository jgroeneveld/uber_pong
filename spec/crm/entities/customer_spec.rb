require_relative '../../spec_helper'

describe CRM::Customer do
  it "should be there" do
    CRM::Customer.new
  end

  it "should have a name" do
    customer = CRM::Customer.new name: 'firma'
    customer.name.should == 'firma'
  end

  it "should have an address" do
    customer = CRM::Customer.new
    customer.address = CRM::Address.new
    customer.address.should_not be_nil
  end
end