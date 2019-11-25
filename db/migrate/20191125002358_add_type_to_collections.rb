class AddTypeToCollections < ActiveRecord::Migration[5.2]
  def change
    add_column :collections, :type, :integer, default: 0
  end
end
