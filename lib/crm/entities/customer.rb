require 'crm/entities/address'
require 'crm/entities/person'
require 'crm/entities/customer_rating'
require 'crm/errors'

module CRM
  class Customer
    include Virtus

    attribute :id
    attribute :name, String
    attribute :address, Address
    attribute :rating, Object
    attribute :contacts, Array[Person], default: []

    def initialize(args={})
      self.rating = CustomerRating::UNRATED
      super
    end

    def technical_contact
      contact_for_role(:technical)
    end

    def sales_contact
      contact_for_role(:sales)
    end

    def contact_for_role(role)
      self.contacts.each { |c|
        return c  if c.role == role.to_sym
      }
      raise RoleNotFound
    end
  end
end
