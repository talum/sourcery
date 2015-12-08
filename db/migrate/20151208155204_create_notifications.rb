class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :sender_name
      t.string :content

      t.timestamps null: false
    end
  end
end
