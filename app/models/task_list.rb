class TaskList < ActiveRecord::Base
  attr_accessible :description, :name, :project_id, :user_id
  belongs_to :project
  belongs_to :user
end
