class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :name
      t.string :file_type
      t.text :legend
      t.string :file
      t.belongs_to :user
      t.string :visibility

      t.timestamps
    end
    add_index :uploads, :user_id
  end
end
