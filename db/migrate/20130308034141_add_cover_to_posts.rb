class AddCoverToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :cover, :string
    add_column :posts, :short_text, :text
  end
end
