class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.references :round, null: false, index: true
      t.references :card, null: false, index: true
      t.string :user, null: false
      t.timestamps
    end
  end
end
