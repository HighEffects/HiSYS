class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :short_description
      t.text :description
      t.integer :price
      t.string :currency
      t.string :category
      t.string :cover
      t.integer :user_id
      t.string :slug

      t.timestamps
    end
  end
end
