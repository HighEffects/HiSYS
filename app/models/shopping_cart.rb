class ShoppingCart < ActiveRecord::Base
  attr_accessible :status, :user_id
  
  belongs_to :user
  has_many :shopping_cart_items
end
