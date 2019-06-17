class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :subdomain
      t.timestamps
    end

    add_index :stores, :subdomain

    create_table :admin_users_stores, id: false do |t|
      t.belongs_to :admin_users, index: true
      t.belongs_to :stores, index: true
    end
  end
end
