class Project < ActiveRecord::Base
 
  attr_accessible :description, :name, :short_description, :slug, :status, :user_id, :visibility, :cover
  
  mount_uploader :cover, ProjectCoverUploader
  
  belongs_to :user
  
  has_many :project_members
  has_many :task_lists
  
end
