require 'spec_helper'
require 'crm/services/rate_customers'

module CRM

  describe RateCustomers do
    it "should initially be unrated" do
      c = Customer.new
      c.rating.should == CustomerRating::Unrated
    end

    it "should rate a customer" do
      c = Customer.new
      c.stub(:total_payed).and_return(100)

      o = RateCustomers.run!(customers: [c])

      c.rating.should == 1
    end
  end

end