module Admin::SettingsHelper
  def stripe_button_link
    stripe_url = 'https://connect.stripe.com/oauth/authorize'
    client_id = Rails.application.credentials.stripe[:client_id]
  
    "#{stripe_url}?response_type=code&client_id=#{client_id}&scope=read_write"
  end
end
