require_relative '../../spec_helper'

describe TicketSystem::MarkTicketRead do
  it "should mark a ticket read" do
    t = TicketSystem::Ticket.new
    t.is_read = false

    TicketSystem::MarkTicketRead.run! ticket: t

    t.is_read.should eq true
  end
end