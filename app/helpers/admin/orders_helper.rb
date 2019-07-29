module Admin::OrdersHelper
  def active_products
    @current_store.products.where(active: true)
  end
end
