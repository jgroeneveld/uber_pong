require 'test_helper'
require 'billing/entities/billing_report'

module Billing

  describe BillingReport do

    it "has values" do
      report = BillingReport.new amount_due: 12.2, total_payed: 7.3
      report.amount_due.must_equal 12.2
      report.total_payed.must_equal 7.3

    end

  end

end