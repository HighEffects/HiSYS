class Upload < ActiveRecord::Base
  
  belongs_to :user
  
  attr_accessible :file, :file_type, :legend, :name, :visibility
  
  mount_uploader :file, FileUploader
  
  has_many :comments, as: :commentable
  
  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings
  
  has_many :slides
  
end
