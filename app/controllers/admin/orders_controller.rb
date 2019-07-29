class Admin::OrdersController < Admin::AdminController
  before_action :set_admin_order, only: [:show, :edit, :update, :destroy]

  # GET /admin/orders
  # GET /admin/orders.json
  def index
    @admin_orders = @current_store.orders
  end

  # GET /admin/orders/1
  # GET /admin/orders/1.json
  def show
  end

  # GET /admin/orders/new
  def new
    @admin_order = @current_store.orders.new
  end

  # GET /admin/orders/1/edit
  def edit
  end

  # POST /admin/orders
  # POST /admin/orders.json
  def create
    @admin_order    = @current_store.orders.new(admin_order_params)
    @order_products = @current_store.products.where(id: params[:order_products][:ids])
    
    if @order_products.empty?
      @admin_order.errors.add(:order_products, 'At least one product must be selected.')
    end

    @admin_order.total = 0
    @order_products.each do |product|
      @admin_order.total += product.price
    end

    respond_to do |format|
      if @admin_order.errors.empty? && @admin_order.save
        OrderProduct.transaction do
          @order_products.each do |product|
            OrderProduct.new({
              order_id: @admin_order.id,
              product_id: product.id,
              price: product.price,
              title: product.title,
              quantity: 1 # TODO: add quantity to order form
            }).save!
          end
        end

        format.html { redirect_to admin_order_url(@admin_order), notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: admin_order_url(@admin_order) }
      else
        format.html { render :new }
        format.json { render json: @admin_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/orders/1
  # PATCH/PUT /admin/orders/1.json
  def update
    respond_to do |format|
      if @admin_order.update(admin_order_params)
        format.html { redirect_to admin_order_url(@admin_order), notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: admin_order_url(@admin_order) }
      else
        format.html { render :edit }
        format.json { render json: @admin_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/orders/1
  # DELETE /admin/orders/1.json
  def destroy
    @admin_order.destroy
    respond_to do |format|
      format.html { redirect_to admin_orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_order
      @admin_order = @current_store.orders.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_order_params
      params.require(:order)
        .permit(
          :notes,
          :payment_status,
          order_products: [:ids]
        )
    end
end
