require 'test_helper'
require 'mocha/setup'
require 'crm/services/rate_customers'

module CRM

  describe RateCustomers do
    it "should initially be unrated" do
      c = Customer.new
      c.rating.must_equal CustomerRating::UNRATED
    end

    it "should rate a customer" do
      c = mock('Customer', {total_payed: 100})

      c.expects(:rating=).with(1)
      RateCustomers.run!(customers: [c])
    end
  end

end
