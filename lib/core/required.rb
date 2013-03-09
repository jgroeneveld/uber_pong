module Core
  class Required
    def initialize(desc='')
      raise "#{desc} Is Required"
    end
  end
end