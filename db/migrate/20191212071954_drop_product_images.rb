class DropProductImages < ActiveRecord::Migration[5.2]
  def up
    drop_table :product_images
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
