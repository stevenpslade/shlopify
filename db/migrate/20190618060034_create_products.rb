class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :type
      t.decimal :price, precision: 8, scale: 2
      t.decimal :compare_at_price, precision: 8, scale: 2
      t.decimal :cost_per_item, precision: 8, scale: 2
      t.integer :quantity
      t.boolean :allow_out_of_stock_purchase, default: false
      t.boolean :active, default: true
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
