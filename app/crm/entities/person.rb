require_relative '../../core/entity'

module CRM
  class Person < Core::Entity
    ROLES = [ :technical, :sales ]

    attr_accessor :first_name, :last_name, :role, :email

    def role=(r)
      r = r.to_sym
      raise "Unknown Role"  unless ROLES.include?(r)
      @role = r
    end
  end
end