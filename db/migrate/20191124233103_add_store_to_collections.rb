class AddStoreToCollections < ActiveRecord::Migration[5.2]
  def change
    add_reference :collections, :store, foreign_key: true
  end
end
