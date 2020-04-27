class CartsController < ApplicationController
  def add
    product_id = params[:product_id].to_s
    modify_delta(product_id, +1)

    render json: cart_json, status: :ok
  end

  def remove
    product_id = params[:product_id].to_s
    modify_delta(product_id, -1)

    render json: cart_json, status: :ok
  end

  def remove_product
    product_id = params[:product_id].to_s
    cart.delete(product_id)
    update_cart(cart)

    render json: cart_json, status: :ok
  end

  private

  def modify_delta(product_id, delta)
    cart[product_id] = (cart[product_id] || 0) + delta
    cart.delete(product_id) if cart[product_id] < 1
    update_cart(cart)
  end
end
