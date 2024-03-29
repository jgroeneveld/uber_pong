require 'spec_helper'
require 'ticket_system/services/create_ticket'

module TicketSystem

  describe CreateTicket do
    it "should create a ticket" do
      t = CreateTicket.run! title: 'hi', description: 'hello'

      t.should_not eq nil
      t.title.should eq 'hi'
      t.description.should eq 'hello'
    end
  end

end