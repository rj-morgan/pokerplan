# Standardise column names and FKs from initial models
class TidyRoomIdColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :rooms, :roomid
    remove_column :rounds, :roomid

    add_column :rounds, :room_id, :bigint
    add_foreign_key :rounds, :rooms
    add_index :rounds, :room_id
  end
end
