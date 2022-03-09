class RemoveRoundCardsetColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :rounds, :cardset
  end
end
