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

# module CRM
#   class Person < Core::Entity
#     class UnknownRole < Exception; end

#     include DataMapper::Resource

#     property :id, Serial
#     property :name, String

#     property :first_name, String
#     property :last_name, String
#     property :role, String
#     property :email, String

#     ROLES = [ :technical, :sales ]

#     def role=(r)
#       r = r.to_sym
#       raise UnknownRole  unless ROLES.include?(r)
#       @role = r
#     end
#   end
# end