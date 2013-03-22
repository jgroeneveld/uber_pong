require 'mutations_enhanced'
require 'crm/repos/customers_repo'
require 'uber_pong'

module CRM
  class SendNewsletter < Mutations::Command
    required do
      string :subject
      string :body
    end

    def execute
      CustomersRepo.all.each { |customer|
        UberPong.mailer.send_mail('', subject, body)
      }
    end


  end
end
