class AddStripeUserIdToStores < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :stripe_user_id, :string
  end
end
