class RemoveTaggingsCountFromTaggings < ActiveRecord::Migration[5.2]
  def change
    remove_column :taggings, :taggings_count, :integer
  end
end
