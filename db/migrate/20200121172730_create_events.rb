class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.datetime :date
      t.integer :creator_id

      t.timestamps
    end
  end
end
