class ProductsController < ApplicationController
  before_action :set_product, only: :show

  def index
    # TODO:
    # - pagination
    # - active, quantity > 0, etc.
    @products = @current_store.products
  end

  def show
    @product_image_urls = @product.images.map { |image| url_for(image) }
  end

  private
    def set_product
      @product = @current_store.products.find(params[:id])
    end
end
