require 'spec_helper'
require 'crm/services/rate_customers'

module CRM

  describe RateCustomers do
    it "should initially be unrated" do
      c = Customer.new
      c.rating.should == CustomerRating::UNRATED
    end

    it "should rate a customer" do
      c = double('Customer', {total_payed: 100})

      c.should_receive(:rating=).with(1)
      RateCustomers.run!(customers: [c])
    end
  end

end
