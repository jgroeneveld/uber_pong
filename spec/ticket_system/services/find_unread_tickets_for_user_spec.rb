require 'spec_helper'
require 'ticket_system/services/find_unread_tickets_for_user'

describe TicketSystem::FindUnreadTicketsForUser do
  it "finds unread tickets for a user" do
    user_id = 3

    repo = double('repo')
    repo.should_receive(:find).with({is_read: false, assigned_to_user_id: user_id})

    unread_tickets = TicketSystem::FindUnreadTicketsForUser.run! user_id: user_id, tickets_repo: repo
  end
end
