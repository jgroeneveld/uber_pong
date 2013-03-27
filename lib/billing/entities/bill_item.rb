require 'virtus'

module Billing
  class BillItem
    include Virtus::ValueObject
    attribute :title, String
    attribute :amount, Float
    attribute :price, Float

    def sub_total
      self.amount.to_f * self.price.to_f
    end
  end
end