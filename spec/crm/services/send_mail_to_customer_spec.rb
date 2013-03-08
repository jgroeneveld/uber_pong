require_relative '../../spec_helper'

describe CRM::SendMailToCustomer do
  it "should send a mail to the technical contact" do
    technical = CRM::Person.new(role: :technical, email: 'test@test.de')
    customer = CRM::Customer.new
    customer.contacts << technical

    mailer = double('mailer')
    mailer.should_receive(:send).with(technical.email)

    CRM::SendMailToCustomer.run!(customer: customer, mailer: mailer)
  end
end