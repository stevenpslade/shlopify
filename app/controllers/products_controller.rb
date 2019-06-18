class ProductsController < ApplicationController
  def index
    @products = @current_store.products
  end

  def show
  end
end
