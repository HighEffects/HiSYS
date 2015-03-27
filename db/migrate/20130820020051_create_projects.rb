class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :slug
      t.string :short_description
      t.text :description
      t.string :visibility
      t.string :status
      t.string :cover
      t.integer :user_id

      t.timestamps
    end
  end
end
