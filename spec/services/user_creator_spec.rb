require "spec_helper"

describe UserCreator do
  let(:email) { "wilma@flinstones.com" }
  let(:creator) { UserCreator.new(email: email) }

  it "is instantiated with one arg, the email address of the user to create" do
    expect(creator).to be_kind_of UserCreator
  end

  describe "#create_user" do
    let(:user) { creator.create_user }

    it "returns a user" do
      expect(user).to be_kind_of User
    end

    it "gives the user the passed-in email address" do
      expect(user.email).to eq email
    end

    it "assigns the user a random password" do
      expect(user.password).not_to be_nil
    end

    it "actually persists the user" do
      expect(user).to eq User.first
    end

    it "sets the user's auth_token" do
      expect(user.auth_token).not_to be_nil
    end

    it "sets the user's password_reset_token" do
      expect(user.password_reset_token).not_to be_nil
    end

    it "sets the user's password_reset_sent_at" do
      expect(user.password_reset_token).not_to be_nil
    end

    it "sends the user a welcome email" do
      user # instantiate
      expect(last_email.to).to eq [email]
      expect(last_email.subject).to match "Welcome"
    end
  end
end
