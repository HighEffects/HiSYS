class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :task_list
  attr_accessible :completed, :name
end
