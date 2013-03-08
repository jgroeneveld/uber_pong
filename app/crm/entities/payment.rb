module CRM

  class Payment
    attr_accessor :amount

    def initialize(args={})
      self.amount = args[:amount]
    end
  end

end