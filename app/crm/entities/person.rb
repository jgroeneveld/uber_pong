module CRM
  class Person
    ROLES = [ :technical, :sales ]

    attr_accessor :first_name, :last_name, :role, :email

    def initialize(args={})
      self.first_name = args[:first_name]
      self.last_name = args[:last_name]
      self.role = args[:role]
      self.email = args[:email]
    end

    def role=(r)
      r = r.to_sym
      raise "Unknown Role"  unless ROLES.include?(r)
      @role = r
    end
  end
end