require 'spec_helper'
require 'crm/services/rate_customers'

module CRM

  describe RateCustomers do
    it "should initially be unrated" do
      c = Customer.new
      c.rating.should == CustomerRating::UNRATED
    end

    it "should rate a customer" do
      # rspec/fire is how we can find boundary problems
      # this spec should fail because Customer does not have a method total_payed
      c = fire_double('CRM::Customer', {total_payed: 100})

      c.should_receive(:rating=).with(1)
      RateCustomers.run!(customers: [c])
    end
  end

end
