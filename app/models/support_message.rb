class SupportMessage < ActiveRecord::Base
  
  validates :title, :message, :email, presence: true
  
  belongs_to :user
  attr_accessible :email, :message, :title
end
