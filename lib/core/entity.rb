module Core

  # dies ist eigentlich wie virtus verhalten nur das ich es vorher gebaut hatte
  class Entity
    class UndefinedSetter < Exception; end
    attr_accessor :attributes

    def self.property(name, klass)
      define_method "#{name}=" do |value|
        self.attributes[name.to_sym] = value
        instance_variable_set("@#{name}", value)
      end

      define_method "#{name}" do
        instance_variable_get("@#{name}")
      end
    end

    def initialize(args={})
      self.attributes = {}

      args.each { |k,v|
        if self.respond_to?("#{k}=")
          self.attributes[k] = v
          self.send("#{k}=", v)
        else
          raise UndefinedSetter
        end
      }
    end

  end
end

