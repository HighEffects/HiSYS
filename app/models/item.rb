class Item < ActiveRecord::Base
  attr_accessible :currency, :description, :name, :human_price, :short_description
  
  def human_price
    price.to_d/100 if price
  end
    
  def human_price=(dollars)
    self.price = dollars.to_d * 100 if dollars.present?
  end
  
end
