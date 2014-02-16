require "spec_helper"

describe PasswordResetWorker do
  let(:user) { build :user }

  describe :perform do
    it "sends a password_reset email to the user with the passed-in id" do
      User.stub(:find).and_return(user)
      PasswordResetWorker.new.perform(user.id)
      expect(last_email.to).to eq [user.email]
      expect(last_email.subject).to match "Password Reset"
    end
  end
end
