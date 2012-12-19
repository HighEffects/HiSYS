class Page < ActiveRecord::Base
  attr_accessible :content, :name, :slug
end
