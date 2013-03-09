module Core
  class Entity
    class UndefinedSetter < Exception; end

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
