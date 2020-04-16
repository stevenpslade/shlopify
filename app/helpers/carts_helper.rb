module CartsHelper
  def cart
    @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
  end

  def cart_data
    @cart_data ||= Product.where(id: cart.keys).map {|product| { product: product, quantity: cart[product.id.to_s] } }
  end

  def cart_subtotal
    cart_data.map {|entry| entry[:product].price * entry[:quantity]}.sum
  end

  def update_cart(new_cart)
    cookies[:cart] = {
      value: JSON.generate(new_cart),
      expires: 10.days.from_now
    }
    cookies[:cart]
  end
end
