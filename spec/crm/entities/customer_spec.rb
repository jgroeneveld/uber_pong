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


    context "billing" do
      its(:bills) { should be_empty }
      its(:amount_due) { should == 0 }
      its(:total_payed) { should == 0 }
      its(:rating) { should_not be_nil }

      it "should calculate amount due correctly" do
        b1 = Billing::Bill.new
        b1.add_item(title: "Brot", amount: 1, price: 10)
        subject.bills << b1

        b2 = Billing::Bill.new
        b2.add_item(title: "Brot", amount: 2, price: 12)
        subject.bills << b2

        subject.amount_due.should == b1.total + b2.total
      end

      it "should have a total_payed amount" do
        b = Billing::Bill.new
        b.add_item(title: "Brot", amount: 1, price: 10)
        b.mark_payed!
        subject.bills << b

        subject.total_payed.should == b.total
      end

      it "should not count unpayed bills when calculating total payed" do
        b1 = Billing::Bill.new
        b1.add_item(title: "Brot", amount: 1, price: 10)
        b1.mark_payed!
        subject.bills << b1

        b2 = Billing::Bill.new
        b2.add_item(title: "Brot", amount: 2, price: 12)
        subject.bills << b2

        subject.total_payed.should == b1.total
      end
    end

  end

end
