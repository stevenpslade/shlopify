class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.string :title
      t.text :description

      t.timestamps
    end

    create_table :collection_products do |t|
      t.belongs_to :collection, index: true
      t.belongs_to :product, index: true
    
      t.timestamps
    end

    create_table :collection_tags do |t|
      t.belongs_to :collection, index: true
      t.belongs_to :tag, index: true
    
      t.timestamps
    end
  end
end
