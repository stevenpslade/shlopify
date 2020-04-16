class CartsController < ApplicationController
  def show
  end

  def add
    product_id = params[:product_id].to_s
    modify_delta(product_id, +1)

    # return json data of product added?
    render json: {message: "Added #{product_id} to Cart!"}, status: :ok
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
