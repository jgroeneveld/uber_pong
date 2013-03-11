require 'spec_helper'
require 'crm/entities/address'

module CRM

  describe Address do
    it "creates" do
      a = Address.new(street: "Haraldstr 12", zip: 12345)
      a.street.should == "Haraldstr 12"
      a.zip.should == 12345
    end
  end

end