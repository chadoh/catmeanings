require "spec_helper"

describe User do
  let(:name) { "wilma" }
  let(:domain) { "flinstones.com" }
  let(:user) { build :user, username: name, email: "#{name}@#{domain}" }

  describe :to_s do
    it "returns the user's username" do
      expect(user.to_s).to eq name
    end
  end
end
