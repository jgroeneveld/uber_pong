require 'spec_helper'
require 'billing/entities/bill_item'

describe Billing::BillItem do
  subject { Billing::BillItem.new }

  it "should have a title, amount and price" do
    expect {
      subject.title = 'hans'
      subject.amount = 2
      subject.price = 2.0
      }.not_to raise_error
  end

  it "should calculate the sub_total of this item" do
      subject.amount = 1
      subject.price = 2.0
      subject.sub_total.should == 2
  end

  it "should calculate the sub_total of this item with more amount" do
      subject.amount = 2
      subject.price = 2.0
      subject.sub_total.should == 4
  end
end