class User < ApplicationRecord
  validates :name, presence: true
  has_many :events, foreign_key: 'creator_id'
  has_many :invites, foreign_key: 'attendee_id'
  has_many :attending_events, through: :invites, source: :attended_event

  def upcoming_events
    attending_events.where("date > ?", DateTime.now)
  end

  def previous_events
    attending_events.where("date <= ?", DateTime.now)
  end
end
