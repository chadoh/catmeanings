class WelcomeEmailWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find user_id
    UserMailer.welcome(user).deliver
  end
end
