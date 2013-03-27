require 'virtus'

class BillingReport
  include Virtus::ValueObject

  attribute :amount_due, Float
  attribute :total_payed, Float
end