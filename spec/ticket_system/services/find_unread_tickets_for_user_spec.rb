require 'spec_helper'
require 'ticket_system/services/find_unread_tickets_for_user'

module TicketSystem

  describe FindUnreadTicketsForUser do
    it "finds unread tickets for a user" do
      user_id = 3

      repo = double('repo')
      repo.should_receive(:find).with({is_read: false, assigned_to_user_id: user_id})

      unread_tickets = FindUnreadTicketsForUser.run! user_id: user_id, tickets_repo: repo
    end
  end

end
