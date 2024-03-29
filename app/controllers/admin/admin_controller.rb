class Admin::AdminController < ApplicationController
  before_action :require_login
  before_action :require_store_set
  before_action :require_store_ownership

  layout "admin"

  private
    def require_login
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def require_store_set
      unless @current_store
        redirect_to subdomain: @current_user.stores.first.subdomain
      end
    end
    
    def require_store_ownership
      unless @current_user == @current_store.admin_users.first
        flash[:danger] = "What's wrong with your Shlop?"
        redirect_to admin_dashboard_url(subdomain: logged_in? ? @current_user.stores.first.subdomain : false)
      end
    end
end