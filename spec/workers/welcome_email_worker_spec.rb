require 'spec_helper'

describe WelcomeEmailWorker do
  let(:user) { build :user }

  describe :perform do
    it "sends the welcome email to the user with the passed-in id" do
      User.stub(:find).and_return(user)
      WelcomeEmailWorker.new.perform(user.id)
      expect(last_email.to).to eq [user.email]
      expect(last_email.subject).to match "Welcome"
    end
  end
end
