require 'crm/entities/customer'
require 'crm/entities/person'
require 'billing/entities/bill'


describe CRM::Customer do
  subject { CRM::Customer.new }

  it "should be there" do
    CRM::Customer.new
  end

  it "should have a name" do
    customer = CRM::Customer.new(name: 'firma')
    customer.name.should == 'firma'
  end

  it "should have an address field" do
    subject.should respond_to :address
  end

  it "should have a technical contact" do
    contact = CRM::Person.new(role: 'technical', first_name: 'hans', last_name: 'peter')
    subject.contacts << contact
    subject.technical_contact.should == contact
  end

  it "should have a sales contact" do
    contact = CRM::Person.new(role: 'sales', first_name: 'hans', last_name: 'peter')
    subject.contacts << contact
    subject.sales_contact.should == contact
  end

  it "should throw an error if the contact for a role cant be found" do
    expect {
      subject.contact_for_role(:something)
    }.to raise_error
  end



  context "billing" do
    it "should have bills" do
      subject.bills.should be_empty
    end

    it "should have a amount due" do
      subject.amount_due.should == 0
    end

    it "should calculate amount due correctly" do
      b = Billing::Bill.new
      b.add_item(title: "Brot", amount: 1, price: 10)

      subject.bills << b

      subject.amount_due.should == 10
    end

    it "should have a rating" do
      subject.rating.should_not be_nil
    end

    it "should have a initial total_payed amount of 0" do
      subject.total_payed.should == 0
    end

    it "should have a total_payed amount" do
      b = Billing::Bill.new
      b.add_item(title: "Brot", amount: 1, price: 10)
      b.mark_payed!
      subject.bills << b

      subject.total_payed.should == 10
    end
  end

end