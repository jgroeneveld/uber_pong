require 'spec_helper'
require 'crm/services/send_mail_to_customer'
require 'crm/entities/person'
require 'crm/entities/customer'

describe CRM::SendMailToCustomer do
  it "should send a mail to the technical contact" do
    technical = CRM::Person.new(role: :technical, email: 'technical@test.de')
    customer = CRM::Customer.new
    customer.contacts << technical

    mailer = double('mailer')
    mailer.should_receive(:send_mail).with(technical.email)

    CRM::SendMailToCustomer.run!({
      customer: customer,
      role: :technical,
      mailer: mailer
    })
  end

  it "should send a mail to the sales contact" do
    sales = CRM::Person.new(role: :sales, email: 'sales@test.de')
    customer = CRM::Customer.new

    customer.contacts << sales

    mailer = double('mailer')
    mailer.should_receive(:send_mail).with(sales.email)

    CRM::SendMailToCustomer.run!({
      customer: customer,
      role: :sales,
      mailer: mailer
    })
  end

  it "should throw an error if there is not contact with the given role" do
    customer = CRM::Customer.new
    mailer = double('mailer')

    expect {
      CRM::SendMailToCustomer.run!({
        customer: customer,
        role: :sales,
        mailer: mailer
      })
    }.to raise_error
  end
end
