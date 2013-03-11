# TODO diese sollten nicht im hauptnamensraum sein.
class Serial; end




module Core

  class Entity
    class UndefinedSetter < Exception; end

    def self.property(name, klass)
      define_method "#{name}=" do |value|
        instance_variable_set("@#{name}", value)
      end

      define_method "#{name}" do
        instance_variable_get("@#{name}")
      end
    end

    def initialize(args={})
      args.each { |k,v|
        if self.respond_to?("#{k}=")
          self.send("#{k}=", v)
        else
          raise UndefinedSetter
        end
      }
    end

  end
end
