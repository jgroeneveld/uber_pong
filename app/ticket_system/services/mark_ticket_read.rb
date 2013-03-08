module TicketSystem
  class MarkTicketRead < Mutations::Command
    required do
      object :ticket
    end

    def execute
      ticket.is_read = true
    end
  end
end