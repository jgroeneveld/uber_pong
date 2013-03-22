require 'crm/entities/customer'

module CRM

  Perpetuity.generate_mapper_for Customer do
    attribute :name

    index :id
  end

  CustomersRepo = Perpetuity[Customer]

end
