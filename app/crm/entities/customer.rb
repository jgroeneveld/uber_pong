module CRM
  class Customer
    attr_accessor :name
    attr_accessor :address
    attr_accessor :rating
    attr_accessor :payments
    attr_accessor :contacts

    def initialize(args={})
      @name = args[:name]

      @rating = 0
      @payments = []
      @contacts = []
    end

    def total_payed
      @payments.map(&:amount).inject(0) { |a,b| a+b }
    end

    def technical_contact
      find_contact_by_role(:technical)
    end

    def sales_contact
      find_contact_by_role(:sales)
    end

    def find_contact_by_role(role)
      @contacts.each { |c|
        return c  if c.role == role
      }
      nil
    end
  end
end