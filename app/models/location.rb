class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :name
  has_many :assets
end
