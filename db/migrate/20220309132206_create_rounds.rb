class CreateRounds < ActiveRecord::Migration[7.0]
  def change
    create_table :rounds do |t|
      t.integer :roomid
      t.timestamp :started
      t.timestamp :finished
      t.string :started_by
      t.string :cardset

      t.timestamps
    end
  end
end
