class CreateShoppingCartItems < ActiveRecord::Migration
  def change
    create_table :shopping_cart_items do |t|
      t.belongs_to :item
      t.belongs_to :shopping_cart
      t.integer :quantity

      t.timestamps
    end
  end
end
