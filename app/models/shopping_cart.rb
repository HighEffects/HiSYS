class ShoppingCart < ActiveRecord::Base
  attr_accessible :status, :user_id, :location_attributes, :shipping_address, :payment_method, :final_price, :final_price_currency, :checkout_date, :shipping_date, :arrival_date, :note
  
  belongs_to :user
  has_many :shopping_cart_items
  belongs_to :location
  
  attr_writer :shipping_address
  
  
  before_save :create_location
  
  def create_location 
    if self.location
      self.location.name = shipping_address
      self.location.address = shipping_address
      self.location.save
    else
      self.location = Location.create(name: @shipping_address, address: @shipping_address) if @shipping_address.present?
    end
  end
  
  def shipping_address
    if self.location
      @shipping_address || self.location.address
    end
  end

end
