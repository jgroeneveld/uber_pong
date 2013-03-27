require 'virtus'

module CRM

  class Address
    include Virtus::ValueObject

    attribute :street, String
    attribute :zip, String
  end

end
