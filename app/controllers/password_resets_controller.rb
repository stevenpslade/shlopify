class PasswordResetsController < ApplicationController
  before_action :get_user,         only: [:edit, :update]
  before_action :valid_admin_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @admin_user = Admin::User.find_by(email: params[:password_reset][:email].downcase)
    if @admin_user
      @admin_user.create_reset_digest
      @admin_user.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flase.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:admin_user][:password].empty?
      @admin_user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @admin_user.update_attributes(admin_user_params)
      log_in @admin_user
      @admin_user.update_attribute(:reset_digest, nil)
      flash[:success] = "Password has been reset."
      redirect_to @admin_user
    else
      render 'edit'
    end
  end

  private

    def admin_user_params
      params.require(:admin_user).permit(:password, :password_confirmation)
    end

    def get_user
      @admin_user = Admin::User.find_by(email: params[:email])
    end

    # Confirms a valid user.
    def valid_admin_user
      unless (@admin_user && @admin_user.activated? && @admin_user.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

    # Checks expiration of reset token.
    def check_expiration
      if @admin_user.password_reset_expired?
        flash[:danger] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end
end
