module TicketSystem
  class MarkTicketRead < Mutations::Command
    required do
      dynamic :ticket
    end

    def execute
      ticket.is_read = true
    end
  end
end