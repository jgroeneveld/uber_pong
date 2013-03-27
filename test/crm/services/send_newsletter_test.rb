require 'test_helper'
require 'mocha/setup'

require 'support/perpetuity'

require 'crm/services/send_newsletter'
require 'crm/repos/customers_repo'

module CRM

  describe SendNewsletter do

    it "should send a newsletter to all customers" do
      CustomersRepo.insert Fabricate(:customer)
      CustomersRepo.insert Fabricate(:customer)

      UberPong.mailer.expects(:send_mail).twice

      SendNewsletter.run! subject: "Hallo Welt", body: "Guten Tag\nmiau"
    end

  end
end
