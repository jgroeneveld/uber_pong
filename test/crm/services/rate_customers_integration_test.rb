require 'test_helper'
require 'crm/services/rate_customers'

module CRM

  describe "RateCustomers Integration" do
    it "should rate a customer" do
      skip()
      c = Fabricate(:customer)

      RateCustomers.run!(customers: [c])
    end
  end

end
