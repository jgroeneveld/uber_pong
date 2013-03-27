require 'test_helper'
require 'ticket_system/entities/ticket'


module TicketSystem
  describe TicketSystem::Ticket do
    it "should have attributes" do
      ticket = Ticket.new title: 'asd', description: 'asd'
      ticket.title.must_equal 'asd'
      ticket.description.must_equal 'asd'
      ticket.is_read.must_equal false
      ticket.assigned_user_id.must_equal nil
    end
  end
end