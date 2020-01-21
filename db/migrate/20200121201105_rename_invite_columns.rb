class RenameInviteColumns < ActiveRecord::Migration[5.1]
  def change
    rename_column :invites, :guest_id, :attendee_id
    rename_column :invites, :event_id, :attended_event_id
  end
end
