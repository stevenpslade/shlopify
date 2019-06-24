class CreateAdminProductImages < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_product_images do |t|
      t.integer :product_id
      t.string :image

      t.timestamps
    end
  end
end
