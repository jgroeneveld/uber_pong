module CRM
  class RateCustomers < Mutations::Command
    required do
      model :customer, class: CRM::Customer
    end

    def execute
      customer.rating = customer.total_payed > 0 ? 1 : 0
    end
  end
end