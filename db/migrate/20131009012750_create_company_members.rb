class CreateCompanyMembers < ActiveRecord::Migration
  def change
    create_table :company_members do |t|
      t.belongs_to :user
      t.string :position

      t.timestamps
    end
    add_index :company_members, :user_id
  end
end
