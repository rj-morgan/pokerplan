# POKER ROOM
class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.integer :roomid
      t.string :owner
      t.timestamp :opened
      t.timestamp :closed

      t.timestamps
    end
  end
end
