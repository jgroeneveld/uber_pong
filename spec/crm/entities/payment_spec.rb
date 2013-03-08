require_relative '../../spec_helper'

describe CRM::Payment do
  it "has a amount" do
    p = CRM::Payment.new amount: 100
    p.amount.should == 100
  end
end