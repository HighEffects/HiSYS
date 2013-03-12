class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :asset_type
      t.integer :item_id
      t.integer :quantity
      t.integer :owner
      t.integer :location

      t.timestamps
    end
  end
end
