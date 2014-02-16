class UserCreator
  def initialize(email: "")
    @email = email
  end

  def create_user
    user = User.create(
      email: email,
      password: password,
      password_confirmation: password,
      auth_token: auth_token,
    )
    PasswordReset.new(user).set_reset_token
    WelcomeEmailWorker.perform_async(user.id)
    user
  end

  private

  attr_reader :email

  def password
    @password ||= SecureRandom.base64
  end

  def auth_token
    @auth_token ||= SecureRandom.uuid
  end
end
