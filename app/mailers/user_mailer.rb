class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: t(".acc_activation")
  end

  def password_reset; end
end
