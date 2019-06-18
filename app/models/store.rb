class Store < ApplicationRecord
  has_and_belongs_to_many :admin_users
  has_many :products

  def find_by_subdomain(subdomain)
    store = find_by(subdomain: subdomain)
    if store && store.active
      store
    else
      flash[:warning] = "Store not found.";
      redirect_to root_url
    end
  end
end
