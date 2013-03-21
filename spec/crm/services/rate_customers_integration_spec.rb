require 'spec_helper'
require 'crm/services/rate_customers'

module CRM

  describe "RateCustomers Integration" do
    xit "should rate a customer" do
      c = Fabricate(:customer)

      RateCustomers.run!(customers: [c])
    end
  end

end
