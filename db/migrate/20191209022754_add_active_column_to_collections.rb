class AddActiveColumnToCollections < ActiveRecord::Migration[5.2]
  def change
    add_column :collections, :active, :boolean, default: true
  end
end
