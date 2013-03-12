
module Core

  class Entity
    class UndefinedSetter < Exception; end

    # module ClassMethods
      def self.property(name, klass)
        define_method "#{name}=" do |value|
          instance_variable_set("@#{name}", value)
        end

        define_method "#{name}" do
          instance_variable_get("@#{name}")
        end
      end
    # end

    # module InstanceMethods
      def initialize(args={})
        args.each { |k,v|
          if self.respond_to?("#{k}=")
            self.send("#{k}=", v)
          else
            raise UndefinedSetter
          end
        }
      end
    # end

    # def self.included(receiver)
    #   receiver.extend         ClassMethods
    #   receiver.send :include, InstanceMethods
    # end

  end
end

