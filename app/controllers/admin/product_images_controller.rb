class Admin::ProductImagesController < ApplicationController
  before_action :set_admin_product_image, only: [:show, :edit, :update, :destroy]

  # GET /admin/product_images
  # GET /admin/product_images.json
  def index
    @admin_product_images = Admin::ProductImage.all
  end

  # GET /admin/product_images/1
  # GET /admin/product_images/1.json
  def show
  end

  # GET /admin/product_images/new
  def new
    @admin_product_image = Admin::ProductImage.new
  end

  # GET /admin/product_images/1/edit
  def edit
  end

  # POST /admin/product_images
  # POST /admin/product_images.json
  def create
    @admin_product_image = Admin::ProductImage.new(admin_product_image_params)

    respond_to do |format|
      if @admin_product_image.save
        format.html { redirect_to @admin_product_image, notice: 'Product image was successfully created.' }
        format.json { render :show, status: :created, location: @admin_product_image }
      else
        format.html { render :new }
        format.json { render json: @admin_product_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/product_images/1
  # PATCH/PUT /admin/product_images/1.json
  def update
    respond_to do |format|
      if @admin_product_image.update(admin_product_image_params)
        format.html { redirect_to @admin_product_image, notice: 'Product image was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_product_image }
      else
        format.html { render :edit }
        format.json { render json: @admin_product_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/product_images/1
  # DELETE /admin/product_images/1.json
  def destroy
    @admin_product_image.destroy
    respond_to do |format|
      format.html { redirect_to admin_product_images_url, notice: 'Product image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_product_image
      @admin_product_image = Admin::ProductImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_product_image_params
      params.require(:admin_product_image).permit(:product_id, :image)
    end
end
