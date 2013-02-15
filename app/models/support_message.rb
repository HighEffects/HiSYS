class SupportMessage < ActiveRecord::Base
  belongs_to :user
  attr_accessible :email, :message, :title
end
