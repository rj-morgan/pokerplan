class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.references :deck, null: false, index: true
      t.string :unit
      t.float :value, null: false
      t.timestamps
    end
  end
end
