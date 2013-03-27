require 'test_helper'
require 'ticket_system/services/mark_ticket_read'
require 'ticket_system/entities/ticket'

module TicketSystem

  describe MarkTicketRead do
    it "should mark a ticket read" do
      t = Ticket.new
      t.is_read = false

      MarkTicketRead.run! ticket: t

      t.is_read.must_equal true
    end
  end

end