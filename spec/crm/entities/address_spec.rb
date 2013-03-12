require 'spec_helper'
require 'crm/entities/address'

module CRM

  describe Address do
    it "creates" do
      a = Address.new(street: "Haraldstr 12", zip: '12345')
      a.street.should == "Haraldstr 12"
      a.zip.should == '12345'
    end

    it "should have a string zip" do
      a = Address.new(street: "Haraldstr 12", zip: 12345)
      a.zip.should == "12345"
    end

    it "is a value object so it should not be possible to change the values after" do
      expect {
        a = Address.new(street: "Haraldstr 12", zip: '12345')
        a.street = 'other'
      }.to raise_error
    end
  end

end