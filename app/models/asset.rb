class Asset < ActiveRecord::Base
  attr_accessible :item_id, :location, :owner, :asset_type
  
  belongs_to :item
  
end
