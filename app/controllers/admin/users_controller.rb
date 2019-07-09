class Admin::UsersController < ApplicationController
  before_action :require_login, only: [:index, :edit, :update, :destroy]
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  # GET /admin/users
  def index
    @admin_users = Admin::User.where(activated: true)
  end

  # GET /admin/users/1
  def show
    @admin_user = Admin::User.find(params[:id])
    redirect_to root_url and return unless @admin_user.activated
  end

  # GET /admin/users/new
  def new
    @admin_user = Admin::User.new
    @admin_user.stores.build
  end

  # GET /admin/users/1/edit
  def edit
  end

  # POST /admin/users
  def create
    @admin_user = Admin::User.new(admin_user_params)

    if @admin_user.save
      @admin_user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      # logging in the user so they can create their store info
      log_in @admin_user
      redirect_to admin_products_url(subdomain: @admin_user.stores.first.subdomain)
    else
      render :new
    end
  end

  # PATCH/PUT /admin/users/1
  def update
    if @admin_user.update(admin_user_params)
      redirect_to @admin_user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/users/1
  def destroy
    @admin_user.destroy
    redirect_to admin_users_url, notice: 'User was successfully destroyed.'
  end

  private
    def correct_user
      redirect_to(root_url) unless current_user?(@admin_user)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @admin_user = Admin::User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_user_params
      params.require(:admin_user)
        .permit(
          :first_name, 
          :last_name, 
          :email, 
          :password, 
          :password_confirmation,
          stores_attributes: [:subdomain]
        )
    end
end
