class ProjectMember < ActiveRecord::Base
  attr_accessible :project, :user, :access, :role
  belongs_to :project
  belongs_to :user
end
