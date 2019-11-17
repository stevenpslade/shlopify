class ApplicationController < ActionController::Base
  before_action :set_current_store

  protect_from_forgery with: :exception
  include Admin::SessionsHelper

  # Pagy gem for pagination
  include Pagy::Backend

  private
    def set_current_store
      if (request.subdomains.first)
        @current_store = Store.find_by_subdomain(request.subdomains.first)

        unless @current_store
          flash[:danger] = "Store not found."
          redirect_to root_url(subdomain: logged_in? ? @current_user.stores.first.subdomain : false)
        end
      end
    end
end
