require 'spec_helper'
require 'ticket_system/entities/ticket'


module TicketSystem
  describe TicketSystem::Ticket do
    it "should have attributes" do
      ticket = Ticket.new title: 'asd', description: 'asd'
      ticket.title.should == 'asd'
      ticket.description.should == 'asd'
      ticket.is_read.should == false
      ticket.assigned_user_id.should == nil
    end
  end
end