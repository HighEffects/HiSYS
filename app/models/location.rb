class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :name
  has_many :assets
  has_many :shopping_carts
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  after_validation :reverse_geocode
  
  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.address = geo.address.to_s + ', ' + geo.country_code.to_s
    end
  end
  
end
