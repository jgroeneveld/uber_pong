require 'test_helper'
require 'ticket_system/services/create_ticket'

module TicketSystem

  describe CreateTicket do
    it "should create a ticket" do
      t = CreateTicket.run! title: 'hi', description: 'hello'

      t.wont_be_nil
      t.title.must_equal 'hi'
      t.description.must_equal 'hello'
    end
  end

end