class Comment < ActiveRecord::Base
  attr_accessible :content, :user
  belongs_to :commentable, polymorphic:true
  belongs_to :user
end
