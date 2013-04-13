class CreateShoppingCarts < ActiveRecord::Migration
  def change
    create_table :shopping_carts do |t|
      t.belongs_to :user
      t.string :status
      t.belongs_to :location
      t.string :payment_method
      t.integer :shipping_cost
      t.string :shipping_currency
      t.timestamps
    end
  end
end
