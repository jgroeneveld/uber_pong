require 'spec_helper'
require 'crm/services/send_mail_to_customer'
require 'crm/entities/person'
require 'crm/entities/customer'

module CRM

  describe SendMailToCustomer do
    it "should send a mail to the technical contact" do
      customer = Fabricate(:customer_with_technical_contact)

      mailer = double('mailer')
      mailer.should_receive(:send_mail).with(customer.technical_contact.email)

      SendMailToCustomer.run!({
        customer: customer,
        role: :technical,
        mailer: mailer
      })
    end

    it "should send a mail to the sales contact" do
      customer = Fabricate(:customer_with_sales_contact)

      mailer = double('mailer')
      mailer.should_receive(:send_mail).with(customer.sales_contact.email)

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
      }.to raise_error RoleNotFound
    end
  end

end