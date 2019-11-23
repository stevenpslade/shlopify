class CreateTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :taggings do |t|
      t.integer :taggings_count
      t.belongs_to :tag, foreign_key: true
      t.belongs_to :product, foreign_key: true
      t.belongs_to :store, foreign_key: true

      t.timestamps
    end
  end
end
