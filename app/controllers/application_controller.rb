class ApplicationController < ActionController::Base
  before_action :set_current_store

  protect_from_forgery with: :exception
  include Admin::SessionsHelper

  private
    def set_current_store
      if (request.subdomains.first)
        @current_store = Store.find_by_subdomain(request.subdomains.first)

        unless @current_store
          flash[:danger] = "Store not found."
          redirect_to root_url(subdomain: false)
        end
      end
    end

    def require_login
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
