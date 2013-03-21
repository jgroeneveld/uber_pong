require 'mutations_enhanced'

require 'billing/entities/billing_report'

module Billing
  class GenerateBillingReport < Mutations::Command
    required do
      array :bills, class: Object
    end

    def execute
      BillingReport.new({
        amount_due: amount_due(bills),
        total_payed: total_payed(bills)
      })
    end

    private

    def amount_due(bills)
      bills.select{ |b| !b.payed? }.map(&:total).inject(0,&:+)
    end

    def total_payed(bills)
      bills.select{ |b| b.payed? }.map(&:total).inject(0,&:+)
    end
  end
end
