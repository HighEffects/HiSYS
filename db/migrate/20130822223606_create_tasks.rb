class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :completed
      t.belongs_to :user
      t.belongs_to :task_list

      t.timestamps
    end
    add_index :tasks, :user_id
    add_index :tasks, :task_list_id
  end
end
