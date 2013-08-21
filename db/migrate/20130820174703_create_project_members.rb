class CreateProjectMembers < ActiveRecord::Migration
  def change
    create_table :project_members do |t|
      t.belongs_to :project
      t.belongs_to :user
      t.string :role
      t.string :access

      t.timestamps
    end
    add_index :project_members, :project_id
    add_index :project_members, :user_id
  end
end
