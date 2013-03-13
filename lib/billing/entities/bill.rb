require 'billing/entities/bill_item'

module Billing
  class Bill
    include Virtus
    attribute :items, Array[BillItem], default: []
    attribute :payed, Boolean, default: false

    alias :payed? :payed

    def total
      self.items.map(&:sub_total).inject(0,&:+)
    end

    def add_item(args={})
      self.items << BillItem.new(args)
    end

    def mark_payed!
      self.payed = true
    end
  end
end
