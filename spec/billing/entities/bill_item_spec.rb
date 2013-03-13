require 'spec_helper'
require 'billing/entities/bill_item'

module Billing

  describe BillItem do
    it "should have a title, amount and price" do
      b = BillItem.new
      b.should respond_to :title
      b.should respond_to :amount
      b.should respond_to :price
    end

    it "should calculate the sub_total of this item" do
      b = BillItem.new amount: 1, price: 2
      b.sub_total.should == 2
    end

    it "should calculate the sub_total of this item with more amount" do
      b = BillItem.new amount: 2, price: 2.5
      b.sub_total.should == 5
    end
  end

end
