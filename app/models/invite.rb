class Invite < ApplicationRecord
  validates :attended_event_id, presence: true
  validates :attendee_id, presence: true, uniqueness: { scope: :attended_event_id }

  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'
end
