require 'spec_helper'
require 'billing/services/generate_billing_report'
require 'billing/entities/bill'

module Billing

  describe GenerateBillingReport do

    it "should generate a report" do
      bills = []
      report = GenerateBillingReport.run!(bills: bills)
    end

    it "should calculate amount due correctly" do
      b1 = Billing::Bill.new
      b1.add_item(title: "Brot", amount: 1, price: 10)

      b2 = Billing::Bill.new
      b2.add_item(title: "Brot", amount: 2, price: 12)
      b2.add_item(title: "Brot2", amount: 1, price: 18)

      report = GenerateBillingReport.run!(bills: [b1, b2])
      report.amount_due.should == b1.total + b2.total
    end

    it "should have a total_payed amount" do
      b = Billing::Bill.new
      b.add_item(title: "Brot", amount: 1, price: 10)
      b.mark_payed!

      report = GenerateBillingReport.run!(bills: [b])
      report.total_payed.should == b.total
    end

    it "should not count unpayed bills when calculating total payed" do
      b1 = Billing::Bill.new
      b1.add_item(title: "Brot", amount: 1, price: 10)
      b1.mark_payed!

      b2 = Billing::Bill.new
      b2.add_item(title: "Brot", amount: 2, price: 12)

      report = GenerateBillingReport.run!(bills: [b1, b2])
      report.total_payed.should == b1.total
    end

  end

end