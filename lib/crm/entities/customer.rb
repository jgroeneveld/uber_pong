require 'crm/entities/address'
require 'crm/entities/person'
require 'crm/entities/customer_rating'
require 'billing/entities/bill'

module CRM
  class Customer
    include Virtus

    attribute :name, String
    attribute :address, Address
    attribute :rating, Object
    attribute :contacts, Array[Person], default: []
    attribute :bills, Array[Billing::Bill], default: []

    def initialize(args={})
      super
      @rating = CustomerRating::Unrated
    end

    def technical_contact
      contact_for_role(:technical)
    end

    def sales_contact
      contact_for_role(:sales)
    end

    def contact_for_role(role)
      @contacts.each { |c|
        return c  if c.role == role
      }
      raise "No Role #{role} defined"
    end
  end
end
