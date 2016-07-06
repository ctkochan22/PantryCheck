class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :pantry_id
      t.integer :sender_id
      t.integer :user_id
      t.boolean :request

      t.timestamps null: false
    end
  end
end
