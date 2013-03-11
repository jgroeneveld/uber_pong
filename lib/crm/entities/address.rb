require 'core/entity'

module CRM

  class Address < Core::Entity
    # include DataMapper::Resource

    property :id, Serial
    property :street, String
    property :zip, String
    # attr_accessor :street, :zip
  end

end