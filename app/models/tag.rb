class Tag < ActiveRecord::Base
  attr_accessible :name, :object_id
  has_many :taggings, :dependent => :destroy
  has_many :posts, :through => :tagings, :source => :taggable, :source_type => "Post"
  has_many :pages, :through => :tagings, :source => :taggable, :source_type => "Page"
  has_many :uploads, :through => :tagings, :source => :taggable, :source_type => "Upload"
  
end
