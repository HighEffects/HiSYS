class CompanyMember < ActiveRecord::Base
  belongs_to :user
  attr_accessible :position
end
