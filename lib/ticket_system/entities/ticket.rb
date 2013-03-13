.module TicketSystem
  class Ticket
    include Virtus

    attribute :title, String
    attribute :description, String
    attribute :is_read, Boolean, default: false
    attribute :assigned_user_id, Integer
  end
end