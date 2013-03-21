require 'crm/entities/person'

Fabricator :person, class_name: "CRM::Person" do
  first_name 'Hans'
  last_name 'Meier'
  email 'hans@meier.de'
end

