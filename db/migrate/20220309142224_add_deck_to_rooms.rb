class AddDeckToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :deck_id, :bigint
    add_foreign_key :rooms, :decks
    add_index :rooms, :deck_id
  end
end
