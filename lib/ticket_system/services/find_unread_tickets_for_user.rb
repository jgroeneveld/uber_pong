require 'mutations_enhanced'

module TicketSystem
  class FindUnreadTicketsForUser < Mutations::Command
    required do
      object :tickets_repo
      integer :user_id
    end

    def execute
      tickets_repo.find is_read: false, assigned_to_user_id: user_id
    end
  end
end