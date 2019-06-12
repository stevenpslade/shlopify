class AddActivationToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :activation_digest, :string
    add_column :admin_users, :activated, :boolean, default: false
    add_column :admin_users, :activated_at, :datetime
  end
end
