require 'spec_helper'
require 'crm/entities/customer'
require 'crm/repos/customers_repo'

module CRM
  describe CustomersRepo do

    it "should persist a simple customer" do
      c = Customer.new name: 'Peter GmbH'
      expect { CustomersRepo.insert c }.to change { CustomersRepo.count }.by 1
    end

    it "should be in the database with the name" do
      c = Customer.new name: 'Maffay GmbH'
      CustomersRepo.insert c

      CustomersRepo.first.name.should == 'Maffay GmbH'
    end

    it "should set the id" do
      c = Customer.new name: "Whateva"
      c.should_not respond_to :id

      id = CustomersRepo.insert c
      id.should_not be_nil
      c.id.should == id
    end

    it "should persist with address embedded" do
      c = Fabricate(:customer)
      c.address.should_not be_nil

      CustomersRepo.insert c

      from_db = CustomersRepo.first
      from_db.address.should == c.address
    end

    it "should persist with contacts" do
      c = Fabricate(:customer_with_technical_contact)
      c.technical_contact.should_not be_nil

      CustomersRepo.insert c

      PeopleRepo.first.id.should == c.technical_contact.id

      from_db = CustomersRepo.first
      CustomersRepo.load_association!(from_db, :contacts)
      from_db.technical_contact.id.should == c.technical_contact.id
    end

  end
end
