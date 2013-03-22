require 'crm/entities/person'

module CRM

  Perpetuity.generate_mapper_for Person do
    index :id

    attribute :first_name
    attribute :last_name
    attribute :email
    attribute :role
  end

  p Person.object_id

  PeopleRepo = Perpetuity[Person]

end
