module Billing
  class BillItem
    include Virtus
    attribute :title, String
    attribute :amount, Integer
    attribute :price, Float

    def sub_total
      self.amount.to_f * self.price.to_f
    end
  end
end