module CRM
  class Customer
    attr_accessor :name
    attr_accessor :address

    def initialize(args={})
      self.name = args[:name]
    end
  end
end