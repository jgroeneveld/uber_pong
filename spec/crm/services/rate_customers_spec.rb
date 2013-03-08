require_relative '../../spec_helper'

describe CRM::RateCustomers do
  it "should rate a customer" do
    c = CRM::Customer.new

    c.rating.should == 0

    c.payments << CRM::Payment.new(amount: 100)
    o = CRM::RateCustomers.run!(customers: [c])

    c.rating.should == 1
  end
end