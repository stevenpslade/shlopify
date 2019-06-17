class ApplicationController < ActionController::Base
  before_action :set_current_store

  protect_from_forgery with: :exception
  include Admin::SessionsHelper

  private
    def set_current_store
      if (request.subdomains.first)
        @current_store = Store.find_by_subdomain(request.subdomains.first)
      end
    end
end
