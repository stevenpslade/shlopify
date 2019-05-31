class Admin::SessionsController < ApplicationController
  def new
  end

  def create
    admin_user = Admin::User.find_by(email: params[:session][:email].downcase)
    if admin_user && admin_user.authenticate(params[:session][:password])
      log_in admin_user
      redirect_to admin_user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
