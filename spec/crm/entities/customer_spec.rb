require_relative '../../spec_helper'

describe CRM::Customer do
  subject { CRM::Customer.new }

  it "should be there" do
    CRM::Customer.new
  end

  it "should have a name" do
    customer = CRM::Customer.new(name: 'firma')
    customer.name.should == 'firma'
  end

  it "should have an address" do
    subject.address = CRM::Address.new
    subject.address.should_not be_nil
  end

  it "should have a rating" do
    subject.rating.should_not be_nil
  end

  it "should have a initial total_payed amount of 0" do
    subject.total_payed.should == 0
  end

it "should have a total_payed amount" do
    subject.total_payed.should == 0
    subject.payments << CRM::Payment.new(amount: 100)
    subject.total_payed.should == 100
  end

  it "should have payments" do
    subject.payments.count == 0
  end

  it "should receive payments" do
    subject.payments << CRM::Payment.new(amount: 100)
    subject.payments.count.should == 1
  end
end