module CRM
  class Person
    class UnknownRole < Exception; end

    include Virtus

    ROLES = [ :technical, :sales ]

    attribute :first_name, String
    attribute :last_name, String
    attribute :email, String
    attribute :role, Symbol

    def role=(r)
      r = r.to_sym
      raise UnknownRole  unless ROLES.include?(r)
      @role = r
    end
  end
end
