class AddCategoryToCollections < ActiveRecord::Migration[5.2]
  def change
    add_column :collections, :category, :boolean, default: false
  end
end
