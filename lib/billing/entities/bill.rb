require 'core/entity'
require 'billing/entities/bill_item'

module Billing
  class Bill < Core::Entity
    attr_reader :items

    attr_accessor :payed
    alias :payed? :payed

    def initialize(args={})
      @items = []
      @payed = false

      super
    end

    def total
      self.items.map(&:sub_total).inject(0,&:+)
    end

    def add_item(args={})
      self.items << Billing::BillItem.new(args)
    end

    def mark_payed!
      self.payed = true
    end
  end
end