require_relative '../../mutations'

module CRM
  class SendMailToCustomer < Mutations::Command
    required do
      object :customer
      object :mailer
      object :role
    end

    def execute
      to = customer.contact_by_role(role).email
      mailer.send_mail(to)
    end
  end
end