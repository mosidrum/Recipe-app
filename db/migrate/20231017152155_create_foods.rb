class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :quantity
      t.float :price
      t.string :measurement_unit
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
