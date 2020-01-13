class StripeController < ApplicationController
  def connect
    ##
    # /stripe/connect is called from outside the admin site.
    # we thus need to actually grab the current store from the logged in admin user and
    # ensure that a stripe_user_id has not already been connected to the store
    current_store = current_user.stores.first
    begin
      raise 'Error connecting Stripe account.' if current_store.stripe_user_id || !params[:code]
      Stripe.api_key = Rails.application.credentials.stripe[:private_key]
      byebug
      response = Stripe::OAuth.token({
        grant_type: 'authorization_code',
        code: params[:code],
      })

      current_store.stripe_user_id = response.stripe_user_id
      current_store.save!

      redirect_to admin_settings_url(subdomain: current_store.subdomain, notice: 'Stripe successfully connected!')
    rescue StandardError => e
      # Log Stripe connect failures
      if e.error.error && e.error.error_description
        logger.tagged('Stripe', e.error.error) do
          logger.error "#{e.error.error_description} for Store ID: #{current_store.id}"
        end
      end

      redirect_to admin_settings_url(subdomain: current_store.subdomain, notice: e.message)
    end
  end
end