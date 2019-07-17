class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :total, precision: 8, scale: 2
      t.decimal :discount, precision: 8, scale: 2
      t.decimal :shipping_amount, precision: 8, scale: 2
      t.text    :notes
      t.integer :payment_status, default: 0
      t.integer :fulfillment_status, default: 0
      t.integer :status, default: 0
      t.references :store, foreign_key: true

      t.timestamps
    end

    create_table :order_products do |t|
      t.belongs_to :order, index: true
      t.belongs_to :product, index: true
      t.decimal    :price, precision: 8, scale: 2
      t.string     :title
    
      t.timestamps
    end
    
  end
end
