require 'crm/entities/customer'
require 'crm/repos/people_repo'

module CRM

  Perpetuity.generate_mapper_for Customer do
    index :id

    attribute :name
    attribute :address, embedded: true
    attribute :contacts
  end

  CustomersRepo = Perpetuity[Customer]
end
