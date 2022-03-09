class CreateDeckAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :deck_assignments do |t|
      t.references :room, null: false, foreign_key: true, index: { unique: true }
      t.references :deck, null: false, foreign_key: true

      t.timestamps
    end
  end
end
