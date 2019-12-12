class DropAdminProductImages < ActiveRecord::Migration[5.2]
  def up
    drop_table :admin_product_images
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
