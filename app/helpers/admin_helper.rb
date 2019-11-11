module AdminHelper
  def get_subitems_by_controller(controller_name)
    subitems = []
    case controller_name
    when 'products'
      subitems << {:title => 'All Products', :link => admin_products_path}
      subitems << {:title => 'Add Product', :link => new_admin_product_path}
    when 'orders'
      subitems << {:title => 'All Orders', :link => admin_orders_path}
      #subitems << {:title => 'Add Order', :link => new_admin_order_path}
    end

    return subitems
  end
end