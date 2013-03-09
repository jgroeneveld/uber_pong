require 'mutations'

module Mutations
  class ObjectFilter < InputFilter
    @default_options = {
    }

    def filter(data)
      # We win, it's valid!
      [data, nil]
    end
  end

  class HashFilter < InputFilter
    def object(name, options = {})
      @current_inputs[name.to_sym] = ObjectFilter.new(options)
    end
  end
end