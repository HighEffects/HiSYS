class Project < ActiveRecord::Base
  attr_accessible :cover, :description, :name, :short_description, :slug, :status, :user_id, :visibility
  
  belongs_to :user
end
