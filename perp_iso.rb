require 'perpetuity'

db = Perpetuity::MongoDB.new(db: 'iso')
Perpetuity.configure do
  data_source db
end

module CRM
  class Customer
    attr_accessor :name, :contacts
  end

  class Person
    attr_accessor :name
  end

  Perpetuity.generate_mapper_for CRM::Person do
    index :id

    attribute :name
  end

  Perpetuity.generate_mapper_for CRM::Customer do
    index :id

    attribute :name
    attribute :contacts
  end




  p = Person.new
  p.name = 'peter'


  c = Customer.new
  c.name = 'gmbh'
  c.contacts = [p]

  Perpetuity[Customer].insert c

  p c.contacts

  p Perpetuity[Customer].all.first
end