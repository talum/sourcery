class AddGmailNameColumntoUser < ActiveRecord::Migration
  def change
    add_column :users, :gmail_name, :string
  end
end
