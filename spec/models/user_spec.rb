require "spec_helper"

describe User do
  let(:name) { "wilma" }
  let(:domain) { "flinstones.com" }
  let(:user) { build :user, email: "#{name}@#{domain}" }

  describe :to_s do
    it "returns the user's email address" do
      expect(user.to_s).to eq user.email
    end
  end
end
