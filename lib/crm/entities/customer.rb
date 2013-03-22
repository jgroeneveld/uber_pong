require 'crm/entities/address'
require 'crm/entities/person'
require 'crm/entities/customer_rating'

module CRM
  class Customer
    class RoleNotFound < Exception; end

    include Virtus

    attribute :name, String
    attribute :address, Address
    attribute :rating, Object
    attribute :contacts, Array[Person], default: []

    def initialize(args={})
      super
      self.rating = CustomerRating::Unrated
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
