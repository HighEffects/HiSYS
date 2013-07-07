class AddDatesToShoppingCarts < ActiveRecord::Migration
  def change
    add_column :shopping_carts, :final_price, :integer
    add_column :shopping_carts, :final_price_currency, :string
    add_column :shopping_carts, :checkout_date, :date
    add_column :shopping_carts, :shipping_date, :date
    add_column :shopping_carts, :arrival_date, :date
    add_column :shopping_carts, :note, :string
  end
end
