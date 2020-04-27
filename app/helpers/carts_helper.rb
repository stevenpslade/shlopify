module CartsHelper
  def cart
    begin
      @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
    rescue JSON::ParserError => e
      # if something is wrong with the cookie we just clear everything
      # not ideal to get rid of the user's cart data but most likely
      # the cookie is corrupt due to user manipulation
      @cart = {}
    end 
  end

  # Array of hashes [{product: Product1, quantity: 1}, {product: Product2, quantity: 1}]
  # TODO: ensure this only retrieves active, in-stock products
  def cart_data
    @cart_data ||= @current_store.products.where(id: cart.keys).map { |product| { product: product, quantity: cart[product.id.to_s] } }
  end

  def cart_subtotal
    cart_data.map { |data| data[:product].price * data[:quantity]}.sum
  end

  def update_cart(new_cart)
    cookies[:cart] = {
      value: JSON.generate(new_cart),
      expires: 10.days.from_now
    }
    cookies[:cart]
  end

  def cart_json
    cart_hash = {}
    products_hash = {}
    cart_data.each do |data|
      product = data[:product]
      quantity = data[:quantity]

      products_hash[product.id] = {
        id: product.id,
        quantity: quantity,
        title: product.title,
        image: url_for(product.images.first),
        price: "$%.2f" % product.price,
        line_price: "$%.2f" % (product.price * quantity),
      }
    end

    cart_hash[:products] = products_hash
    cart_hash[:final_price] = "$%.2f" % cart_subtotal
    cart_hash[:total_cart_count] = cart.count

    JSON.generate(cart_hash)
  end
end
