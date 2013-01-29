class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :title
      t.text :content
      t.belongs_to :upload  
      t.string :link_title
      t.string :link
      t.string :layout

      t.timestamps
    end
  end
end
