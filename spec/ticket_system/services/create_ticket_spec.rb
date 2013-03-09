require_relative '../../../app/ticket_system/services/create_ticket'


describe TicketSystem::CreateTicket do
  it "should create a ticket" do
    t = TicketSystem::CreateTicket.run! title: 'hi', description: 'hello'

    t.should_not eq nil
    t.title.should eq 'hi'
    t.description.should eq 'hello'
  end
end