require_relative '../../core/entity'
require_relative 'customer_rating'

module CRM
  class Customer < Core::Entity
    attr_accessor :name
    attr_accessor :address
    attr_accessor :rating
    attr_accessor :contacts
    attr_accessor :bills

    def initialize(args={})
      super

      @rating = CRM::CustomerRating::Unrated
      @contacts = []
      @bills = []
    end

    def amount_due
      self.bills.select{ |b| !b.payed? }.map(&:total).inject(0,&:+)
    end

    def total_payed
      self.bills.select{ |b| b.payed? }.map(&:total).inject(0,&:+)
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
