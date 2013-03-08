module TicketSystem
  class CreateTicket < Mutations::Command
    required do
      string :title
      string :description
    end

    def execute
      ticket = Ticket.new
      ticket.title = title
      ticket.description = description
      return ticket
    end
  end
end