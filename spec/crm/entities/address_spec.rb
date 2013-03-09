require 'crm/entities/address'

describe CRM::Address do
  it "creates" do
    a = CRM::Address.new(street: "Haraldstr 12", zip: 12345)
    a.street.should == "Haraldstr 12"
    a.zip.should == 12345
  end
end