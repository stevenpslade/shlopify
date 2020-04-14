class CollectionsController < ApplicationController
  before_action :set_collection, only: :show

  def index
  end

  def show
    tag_ids = @collection.tags.map(&:id)
    product_ids = Tagging.where(tag_id: tag_ids, store_id: @current_store.id).map(&:product_id)
    @products = Product.where(id: product_ids, active: true)
  end

  private
    def set_collection
      @collection = @current_store.collections.find(params[:id])
    end
end
