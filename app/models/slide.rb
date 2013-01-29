class Slide < ActiveRecord::Base
  attr_accessible :content, :layout, :link, :link_title, :title, :upload_id
  belongs_to :upload
end
