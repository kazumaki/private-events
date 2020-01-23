require 'rails_helper'

RSpec.describe Invite, :type => :model do
  context "Invite test" do
    it "Should have an Event and an attendee" do
      invite = Invite.new(attendee_id: nil, attended_event_id: nil)
      expect(invite).not_to be_valid
    end

    it "Should have an Event and an attendee" do
      creator = User.create(name: "Creator")
      guest = User.create(name: "Guest")
      event = creator.events.create(description: "Fun Desc", date: DateTime.now)
      invite = event.invites.new(attendee: guest)
      expect(invite).to be_valid
    end
  end
end