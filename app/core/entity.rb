module Core
  class Entity
    def initialize(args={})
      args.each { |k,v|
        if self.respond_to?("#{k}=")
          self.send("#{k}=", v)
        else
          self.instance_variable_set "@#{k}".to_sym, v
        end
      }
    end
  end
end
