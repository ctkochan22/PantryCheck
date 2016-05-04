class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :pantry_id
      t.integer :personalstore_id
      t.string :phone_number, null: false
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
  end
end
