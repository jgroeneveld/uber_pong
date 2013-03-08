module CRM
  class Customer
    attr_accessor :name
    attr_accessor :address
    attr_accessor :rating
    attr_accessor :payments

    def initialize(args={})
      self.name = args[:name]

      self.rating = 0
      self.payments = []
    end

    def total_payed
      self.payments.map(&:amount).inject(0) { |a,b| a+b }
    end
  end
end