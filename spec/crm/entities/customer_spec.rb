require 'spec_helper'
require 'crm/entities/customer'

module CRM

  describe Customer do
    subject { Customer.new }

    specify { subject.should respond_to :address }
    its(:contacts) { should == [] }

    it "should have a name" do
      customer = Customer.new(name: 'firma')
      customer.name.should == 'firma'
    end

    it "should have a technical contact" do
      contact = Person.new(role: 'technical', first_name: 'hans', last_name: 'peter')
      subject.contacts << contact
      subject.technical_contact.should == contact
    end

    it "should have a sales contact" do
      contact = Person.new(role: 'sales', first_name: 'hans', last_name: 'peter')
      subject.contacts << contact
      subject.sales_contact.should == contact
    end

    it "should throw an error if the contact for a role cant be found" do
      expect {
        subject.contact_for_role(:something)
      }.to raise_error
    end




  end

end
