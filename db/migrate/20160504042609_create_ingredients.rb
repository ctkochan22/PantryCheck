class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.integer :pantry_id
      t.string :category
      t.float :amount

      t.timestamps null: false
    end
  end
end
