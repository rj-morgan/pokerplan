# Add anonymity option to room configuration
class AddAnonymousColumnToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :anonymous, :boolean
  end
end
