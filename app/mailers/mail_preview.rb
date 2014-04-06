if Rails.env == "development"
  class MailPreview < MailView
    def welcome
      UserMailer.welcome(user)
    end

    def password_reset
      UserMailer.password_reset(user)
    end

    private

    def user
      User.first || UserCreator.new("chadoh", "hi@chadoh.com").create_user
    end
  end
end
