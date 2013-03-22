require 'crm/entities/customer'

module CRM

  Perpetuity.generate_mapper_for Customer do
    index :id

    attribute :name
    attribute :address, embedded: true
  end

  CustomersRepo = Perpetuity[Customer]
end
