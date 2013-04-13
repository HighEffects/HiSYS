class ShoppingCartItem < ActiveRecord::Base
  attr_accessible :item, :quantity, :shopping_cart
  
  belongs_to :shopping_cart 
  belongs_to :item
end
