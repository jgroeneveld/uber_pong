require 'core/entity'

module CRM
  class Person < Core::Entity
    class UnknownRole < Exception; end

    ROLES = [ :technical, :sales ]

    attr_accessor :first_name, :last_name, :role, :email

    def role=(r)
      r = r.to_sym
      raise UnknownRole  unless ROLES.include?(r)
      @role = r
    end
  end
end