module CRM

  class Address
    attr_accessor :street, :zip

    def initialize(args={})
      self.street = args[:street]
      self.zip = args[:zip]
    end
  end

end