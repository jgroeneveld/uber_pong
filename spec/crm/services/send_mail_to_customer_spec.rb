require 'spec_helper'
require 'crm/services/send_mail_to_customer'
require 'crm/entities/person'
require 'crm/entities/customer'

module CRM

  describe SendMailToCustomer do
    it "should send a mail to the technical contact" do
      technical = Person.new(role: :technical, email: 'technical@test.de')
      customer = Customer.new
      customer.contacts << technical

      mailer = double('mailer')
      mailer.should_receive(:send_mail).with(technical.email)

      SendMailToCustomer.run!({
        customer: customer,
        role: :technical,
        mailer: mailer
      })
    end

    it "should send a mail to the sales contact" do
      sales = Person.new(role: :sales, email: 'sales@test.de')
      customer = Customer.new

      customer.contacts << sales

      mailer = double('mailer')
      mailer.should_receive(:send_mail).with(sales.email)

      SendMailToCustomer.run!({
        customer: customer,
        role: :sales,
        mailer: mailer
      })
    end

    it "should throw an error if there is not contact with the given role" do
      customer = Customer.new
      mailer = double('mailer')

      expect {
        SendMailToCustomer.run!({
          customer: customer,
          role: :sales,
          mailer: mailer
        })
      }.to raise_error
    end
  end

end