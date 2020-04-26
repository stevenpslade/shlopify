class CartsController < ApplicationController
  def add
    product_id = params[:product_id].to_s
    modify_delta(product_id, +1)

    product = @current_store.products.find(params[:product_id])
    quantity = cart[product_id]

    render(
      json: {
        product_id: product_id,
        quantity: quantity,
        title: product.title,
        image: url_for(product.images.first),
        price: product.price,
        line_price: product.price * quantity,
        final_price: cart_subtotal,
        total_cart_count: cart.count,
      },
      status: :ok
    )
  end

  def remove
    product_id = params[:product_id].to_s
    modify_delta(product_id, -1)

    # return json data of product removed?
  end

  private

  def modify_delta(product_id, delta)
    cart[product_id] = (cart[product_id] || 0) + delta
    cart.delete(product_id) if cart[product_id] < 1
    update_cart(cart)
  end
end
