class PasswordReset
  def initialize(user)
    @user = user
  end

  def set_reset_token
    user.password_reset_token = SecureRandom.uuid
    user.password_reset_sent_at = Time.zone.now
    user.save!
  end

  def send_password_reset
    set_reset_token
    PasswordResetWorker.perform_async(user.id)
  end

  private

  attr_reader :user
end
