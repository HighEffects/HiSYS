class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :short_description
      t.text :description
      t.integer :price
      t.string :currency

      t.timestamps
    end
  end
end
