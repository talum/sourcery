class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :topic

      t.timestamps null: false
    end
  end
end
