class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      
      t.integer :item_id
      t.integer :quantity
      t.integer :user_id
      t.integer :location
      t.string :note
      t.boolean :delivered
      t.string :tracking_code
      
      t.timestamps
    end
  end
end
