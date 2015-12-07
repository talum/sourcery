class CreateGoogleDocs < ActiveRecord::Migration
  def change
    create_table :google_docs do |t|
      t.string :title
      t.string :url
      t.string :doc_type
      t.integer :group_id
    end
  end
end
