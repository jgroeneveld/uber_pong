require 'mutations_enhanced'

module CRM
  class SendMailToCustomer < Mutations::Command

    required do
      object :customer
      object :mailer
      object :role
    end

    def execute
      to = customer.contact_for_role(role).email
      mailer.send_mail(to)
    end
  end
end