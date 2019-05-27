class AddIndexToAdminUsersEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :admin_users, :email, unique: true
  end
end

