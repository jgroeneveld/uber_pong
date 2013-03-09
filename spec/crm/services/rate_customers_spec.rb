require 'crm/services/rate_customers'

describe CRM::RateCustomers do
  it "should initially be unrated" do
    c = CRM::Customer.new
    c.rating.should == CRM::CustomerRating::Unrated
  end

  it "should rate a customer" do
    c = CRM::Customer.new
    c.stub(:total_payed).and_return(100)

    o = CRM::RateCustomers.run!(customers: [c])

    c.rating.should == 1
  end
end
