require 'spec_helper'
require 'support/perpetuity'

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

      CustomersRepo.all.first.name.should == 'Maffay GmbH'
    end

    it "should set the id" do
      c = Customer.new name: "Whateva"
      c.id.should be_nil

      id = CustomersRepo.insert c
      id.should_not be_nil
      c.id.should == id
    end

    it "should persist with address" do
      c = Fabricate(:customer)
      c.address.should_not be_nil

      CustomersRepo.insert c

      from_db = CustomersRepo.all.first
      from_db.address.should == c.address
    end

  end
end