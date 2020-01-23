require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'Event test' do
    it 'Should have a description, creator and date' do
      event = Event.new(description: '', creator_id: nil, date: nil)
      expect(event).not_to be_valid
    end

    it 'Should have a description, creator and date' do
      creator = User.create(name: 'Creator')
      event = creator.events.new(description: 'Fun Desc', date: DateTime.now)
      expect(event).to be_valid
    end
  end
end
