require 'test_helper'
require 'crm/entities/customer'

module CRM

  describe Customer do
    subject { Customer.new }

    it "should respond to address" do
      subject.must_respond_to :address
    end

    it "should initially have no contacts" do
      subject.contacts.must_equal []
    end

    it "should have a name" do
      customer = Customer.new(name: 'firma')
      customer.name.must_equal 'firma'
    end

    it "should have a technical contact" do
      contact = Person.new(role: 'technical', first_name: 'hans', last_name: 'peter')

      subject.contacts << contact
      subject.technical_contact.must_equal contact
    end

    it "should have a sales contact" do
      contact = Person.new(role: 'sales', first_name: 'hans', last_name: 'peter')
      subject.contacts << contact
      subject.sales_contact.must_equal contact
    end

    it "should throw an error if the contact for a role cant be found" do
      proc {
        subject.contact_for_role(:something)
      }.must_raise RoleNotFound
    end

    it "should not care about the type of the role" do
      customer = Fabricate(:customer_with_technical_contact)
      customer.contact_for_role("technical").wont_be_nil
    end

    it "should be pending"
  end

end
