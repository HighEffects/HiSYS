class Upload < ActiveRecord::Base
  belongs_to :user
  has_many :slides
  attr_accessible :file, :file_type, :legend, :name, :visibility
  mount_uploader :file, FileUploader
end
