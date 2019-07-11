class Admin::ProductsController < Admin::AdminController
  before_action :set_admin_product, only: [:show, :edit, :update, :destroy]

  # GET /admin/products
  # GET /admin/products.json
  def index
    @admin_products = @current_store.products
  end

  # GET /admin/products/1
  # GET /admin/products/1.json
  def show
    @admin_product  = Product.find(params[:id])
    @product_images = @admin_product.product_images.all
  end

  # GET /admin/products/new
  def new
    @admin_product  = @current_store.products.new
    @product_image  = @admin_product.product_images.build
  end

  # GET /admin/products/1/edit
  def edit
    @product_image  = @admin_product.product_images.build
  end

  # POST /admin/products
  # POST /admin/products.json
  def create
    @admin_product = @current_store.products.new(admin_product_params)

    respond_to do |format|
      if @admin_product.save
        if params[:product_images]
          params[:product_images]['image'].each do |a|
            @product_image = @admin_product.product_images.create!(:image => a, :product_id => @admin_product.id)
          end
        end

        format.html { redirect_to admin_product_url(@admin_product), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @admin_product }
      else
        format.html { render :new }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/products/1
  # PATCH/PUT /admin/products/1.json
  def update
    respond_to do |format|
      if @admin_product.update(admin_product_params)
        if params[:product_images]
          params[:product_images]['image'].each do |a|
            product_image = @admin_product.product_images.create!(:image => a, :product_id => @admin_product.id)
          end
        end

        format.html { redirect_to admin_product_url(@admin_product), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_product }
      else
        format.html { render :edit }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/products/1
  # DELETE /admin/products/1.json
  def destroy
    @admin_product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_product
      @admin_product = @current_store.products.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_product_params
      params.require(:product)
        .permit(
          :title,
          :description,
          :type,
          :price,
          :compare_at_price,
          :cost_per_item,
          :quantity,
          :allow_out_of_stock_purchase,
          product_images_attributes: [:id, :product_id, :image]
        )
    end
end
