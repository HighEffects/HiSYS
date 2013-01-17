class Tagging < ActiveRecord::Base
  attr_accessible :taggging_id, :tag_id
  belongs_to :taggable, polymorphic:true
  belongs_to :tag
end
