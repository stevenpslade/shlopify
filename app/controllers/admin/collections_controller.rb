class Admin::CollectionsController < Admin::AdminController
  include ImageAttachmentConcern

  before_action :set_admin_collection, only: [:show, :edit, :update, :destroy]

  # GET /admin/collections
  # GET /admin/collections.json
  def index
    @pagy, @admin_collections = pagy(@current_store.collections)
    @tags_by_collection_id = Tag.get_tags_by_collection_id(@admin_collections)
  end

  # GET /admin/collections/1
  # GET /admin/collections/1.json
  def show
  end

  # GET /admin/collections/new
  def new
    @admin_collection = Collection.new
  end

  # GET /admin/collections/1/edit
  def edit
    tag_ids = @admin_collection.tags.map(&:id)
    product_ids = Tagging.where(tag_id: tag_ids, store_id: @current_store.id).map(&:product_id)
    @collection_products = Product.where(id: product_ids, active: true)
  end

  # POST /admin/collections
  # POST /admin/collections.json
  def create
    @admin_collection = Collection.new(admin_collection_params)

    respond_to do |format|
      if @admin_collection.save
        format.html { redirect_to edit_admin_collection_url(@admin_collection), notice: 'Collection was successfully created.' }
        format.json { render :show, status: :created, location: @admin_collection }
      else
        format.html { render :new }
        format.json { render json: @admin_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/collections/1
  # PATCH/PUT /admin/collections/1.json
  def update
    respond_to do |format|
      if @admin_collection.update(admin_collection_params)
        format.html { redirect_to edit_admin_collection_url(@admin_collection), notice: 'Collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_collection }
      else
        format.html { render :edit }
        format.json { render json: @admin_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/collections/1
  # DELETE /admin/collections/1.json
  def destroy
    @admin_collection.destroy
    respond_to do |format|
      format.html { redirect_to admin_collections_url, notice: 'Collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_collection
      @admin_collection = Collection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_collection_params
      params.require(:collection)
        .permit(
          :title,
          :description,
          :image,
          :tag_names
        )
    end
end
