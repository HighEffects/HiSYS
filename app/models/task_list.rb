class TaskList < ActiveRecord::Base
  attr_accessible :description, :name, :project, :user
  belongs_to :project
  belongs_to :user
end
