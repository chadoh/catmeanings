class UserMailer < ActionMailer::Base
  default from: "Cat Meanings <support@catmeanings.com>"
  layout "mailer"

  helper EmailHelper

  # Subject set in config/locales/en.yml
  def welcome(user)
    @reset_password_link = edit_password_reset_url(user.password_reset_token)

    mail to: user.email
  end

  # Subject set in config/locales/en.yml
  def password_reset(user)
    @user = user
    mail(to: @user.email)
  end
end
