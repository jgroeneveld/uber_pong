require_relative '../../core/entity'

module CRM

  class Address < Core::Entity
    attr_accessor :street, :zip
  end

end