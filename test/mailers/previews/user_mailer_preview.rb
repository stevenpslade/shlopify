# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/account_activation
  def account_activation
    user = Admin::User.first
    user.activation_token = Admin::User.new_token
    
    UserMailer.account_activation(user)
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/password_reset
  def password_reset
    user = Admin::User.first
    user.reset_token = Admin::User.new_token
    
    UserMailer.password_reset(user)
  end

end
