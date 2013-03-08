module CRM
  class RateCustomers < Mutations::Command
    required do
      array :customers, class: CRM::Customer
    end

    def execute
      customers.each { |customer|
        customer.rating = customer.total_payed > 0 ? 1 : 0
      }
    end
  end
end