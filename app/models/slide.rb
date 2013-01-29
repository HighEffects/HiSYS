class Slide < ActiveRecord::Base
  attr_accessible :content, :layout, :link, :link_title, :title, :upload_id
  belongs_to :upload
  acts_as_list
end
