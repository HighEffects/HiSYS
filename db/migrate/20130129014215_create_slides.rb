class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :title
      t.text :content
      t.belongs_to :upload  
      t.string :link_title
      t.string :link
      t.string :layout
      t.integer :position

      t.timestamps
    end
  end
end
