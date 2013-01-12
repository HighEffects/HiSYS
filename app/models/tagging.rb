class Tagging < ActiveRecord::Base
  attr_accessible :tag_id
  belongs_to :tag
  belongs_to :taggable, polymorphic:true
  
end
