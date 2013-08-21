class CreateTaskLists < ActiveRecord::Migration
  def change
    create_table :task_lists do |t|
      t.string :name
      t.belongs_to :project
      t.belongs_to :user
      t.text :description

      t.timestamps
    end
    add_index :task_lists, :project_id
    add_index :task_lists, :user_id
  end
end
