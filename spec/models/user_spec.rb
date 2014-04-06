require "spec_helper"

describe User do
  let(:name) { "wilma" }
  let(:domain) { "flinstones.com" }
  let(:user) { build :user, email: "#{name}@#{domain}" }

  it "must have an email address" do
    user = User.new
    expect(user).not_to be_valid
    expect(user.errors.messages).to have_key :email
  end

  describe :to_s do
    it "returns the user's email address" do
      expect(user.to_s).to eq user.email
    end
  end
end
