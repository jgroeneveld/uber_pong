require 'contractual'

# require_relative 'vendor/mutations/lib/mutations'
require 'mutations'

module Mutations
  class DynamicFilter < InputFilter
    @default_options = {
      nils: false       # true allows an explicit nil to be valid. Overrides any other options
    }

    def filter(data)

      # Handle nil case
      if data.nil?
        return [nil, nil] if options[:nils]
        return [nil, :nils]
      end

      # We win, it's valid!
      [data, nil]
    end
  end

  class HashFilter < InputFilter
    def dynamic(name, options = {})
      @current_inputs[name.to_sym] = DynamicFilter.new(options)
    end
  end
end

Dir[File.dirname(__FILE__) + "/app/**/*.rb"].each do |file|
  require_relative file
end
