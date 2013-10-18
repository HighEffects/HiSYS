class AddLinksToUsers < ActiveRecord::Migration
  def change
    add_column :users, :website, :string
    add_column :users, :facebook, :string
    add_column :users, :github, :string
    add_column :users, :linkedin, :string
  end
end
