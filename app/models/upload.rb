class Upload < ActiveRecord::Base
  belongs_to :user
  attr_accessible :file, :file_type, :legend, :name, :visibility
  mount_uploader :file, FileUploader
end
