module CRM

  class Address
    include Virtus
    # include DataMapper::Resource

    # property :id, Serial
    # property :street, String
    # property :zip, String
    # attr_accessor :street, :zip

    attribute :street, String
    attribute :zip, String
  end

end