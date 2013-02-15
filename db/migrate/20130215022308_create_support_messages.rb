class CreateSupportMessages < ActiveRecord::Migration
  def change
    create_table :support_messages do |t|
      t.belongs_to :user
      t.string :email
      t.string :title
      t.text :message

      t.timestamps
    end
    add_index :support_messages, :user_id
  end
end
