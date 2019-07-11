class Admin::SessionsController < Admin::AdminController
  skip_before_action :require_login
  skip_before_action :require_store_ownership

  def new
  end

  def create
    user = Admin::User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # temporarily not carring about account activation
      # if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        subdomain = user.stores.first.subdomain
        redirect_to admin_products_url(subdomain: subdomain)
      # else
      #   message  = "Account not activated. "
      #   message += "Check your email for the activation link."
      #   flash[:warning] = message
      #   redirect_to root_url
      # end
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
