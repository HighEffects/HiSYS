class Asset < ActiveRecord::Base
  attr_accessible :item_id, :location, :user_id, :quantity, :note, :delivered, :tracking_code
  
  belongs_to :item
  belongs_to :user
  
end
