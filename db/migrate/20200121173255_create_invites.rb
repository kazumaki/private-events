class CreateInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :invites do |t|
      t.integer :guest_id
      t.integer :event_id

      t.timestamps
    end
  end
end
