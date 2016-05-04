class CreatePantries < ActiveRecord::Migration
  def change
    create_table :pantries do |t|
      t.string :name
      t.boolean :is_private

      t.timestamps null: false
    end
  end
end
