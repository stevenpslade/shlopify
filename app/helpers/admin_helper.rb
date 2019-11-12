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

  def get_pill_status_style(status, border = false)
    color = ''
    case status
      when 'success', 'complete', 'fulfilled'
        color = 'green'
      when 'pending', 'incomplete'
        color = 'orange'
      when 'unfulfilled', 'draft'
        color = 'yellow'
      else
        color = 'gray'
    end

    style = "text-#{color}-700 bg-#{color}-200"
    border ? style << " border-2 border-#{color}-300" : style
  end
end