class AddIndexToEvents < ActiveRecord::Migration[5.1]
  def change
    add_index :invites, [:attendee_id, :attended_event_id], :unique => true
  end
end
