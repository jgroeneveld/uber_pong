require 'crm/entities/customer'

Fabricator :customer, class_name: "CRM::Customer" do
  name 'Hans GmbH'
  rating 1
  address
end

Fabricator :customer_with_technical_contact, from: :customer do
  contacts { [Fabricate(:person, role: :technical)] }
end

Fabricator :customer_with_sales_contact, from: :customer do
  contacts { [Fabricate(:person, role: :sales)] }
end
