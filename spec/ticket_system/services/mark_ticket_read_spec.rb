require_relative '../../../app/ticket_system/services/mark_ticket_read'

require_relative '../../../app/ticket_system/entities/ticket'

describe TicketSystem::MarkTicketRead do
  it "should mark a ticket read" do
    t = TicketSystem::Ticket.new
    t.is_read = false

    TicketSystem::MarkTicketRead.run! ticket: t

    t.is_read.should eq true
  end
end