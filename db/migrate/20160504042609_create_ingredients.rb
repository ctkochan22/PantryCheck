class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.integer :pantry_id
      t.string :name
      t.string :category
      t.string :storage_type
      t.string :amount

      t.timestamps null: false
    end
  end
end
