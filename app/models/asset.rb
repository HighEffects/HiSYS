class Asset < ActiveRecord::Base
  attr_accessible :item_id, :location_id, :user_id, :quantity, :note, :delivered, :tracking_code
  
  belongs_to :item
  belongs_to :user
  belongs_to :location
  
end
