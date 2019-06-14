class AddResetToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :reset_digest, :string
    add_column :admin_users, :reset_sent_at, :datetime
  end
end
