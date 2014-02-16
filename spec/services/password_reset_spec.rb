require "spec_helper"

describe PasswordReset do
  let(:email) { "em@il.it" }
  let(:user) { create :user }
  let(:reset) { PasswordReset.new(user) }

  it "is instantiated with one arg, a user object" do
    expect(reset).to be_kind_of PasswordReset
  end

  describe :set_reset_token do
    it "changes the user's password_reset_token" do
      expect { reset.set_reset_token }.to change{ user.reload.password_reset_token }
    end

    it "sets the user's password_reset_sent_at to the current time" do
      expect { reset.set_reset_token }.to change{ user.reload.password_reset_sent_at}
    end
  end

  describe :send_password_reset do
    it "sets the user's password reset info" do
      reset.should_receive(:set_reset_token).and_call_original
      reset.send_password_reset
    end

    it "sends the user a password reset email" do
      reset.send_password_reset
      expect(last_email.subject).to match "Password Reset"
    end
  end
end
