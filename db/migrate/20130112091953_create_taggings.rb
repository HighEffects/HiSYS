class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.belongs_to :tag
      t.belongs_to :taggable, polymorphic: true

      t.timestamps
    end
    add_index :taggings, [:taggable_id,:taggable_type]
  end
end
