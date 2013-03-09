require_relative 'bill'

module Billing
  class BillItem < Core::Entity
    attr_accessor :title, :amount, :price

    def sub_total
      self.amount.to_f * self.price.to_f
    end
  end
end