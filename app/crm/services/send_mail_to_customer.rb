module CRM
  class SendMailToCustomer < Mutations::Command
    required do
      object :customer
      object :mailer
    end

    def execute
      to = customer.technical_contact.email
      mailer.send(to)
    end
  end
end