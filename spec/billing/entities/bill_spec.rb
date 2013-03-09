require 'spec_helper'
require 'billing/entities/bill'

describe Billing::Bill do
  subject { Billing::Bill.new }

  it "should initially be unpayed" do
    subject.payed?.should == false
  end

  it "should have initially 0 bill items" do
    subject.items.length.should == 0
  end

  it "should contain bill items" do
    subject.add_item title: 'brot', amount: 2, price: 3
    subject.items.length.should == 1
  end

  it "should reflect the total by the bill items" do
    subject.total.should == 0.0
  end

  it "should reflect the total amount by the bill items" do
    subject.add_item title: 'brot', amount: 2, price: 3
    subject.total.should == 6
  end

  it "should reflect the total amount by the bill items with more items" do
    subject.add_item title: 'brot', amount: 2, price: 3
    subject.add_item title: 'brot', amount: 1, price: 7
    subject.total.should == 13
  end

  it "should be payable" do
    subject.mark_payed!
    subject.payed?.should == true
  end
end