require 'test_helper'
require 'crm/entities/address'

module CRM

  describe Address do
    it "creates" do
      a = Address.new(street: "Haraldstr 12", zip: '12345')
      a.street.must_equal "Haraldstr 12"
      a.zip.must_equal '12345'
    end

    it "should have a string zip" do
      a = Address.new(street: "Haraldstr 12", zip: 12345)
      a.zip.must_equal "12345"
    end

    it "is a value object so it should not be possible to change the values after" do
      proc {
        a = Address.new(street: "Haraldstr 12", zip: '12345')
        a.street = 'other'
      }.must_raise NoMethodError
    end
  end

end
