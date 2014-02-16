require 'spec_helper'
describe ApplicationHelper do
  let(:user) { build :user }

  describe :gravatar_for do
    subject { helper.gravatar_for(user) }
    it "includes a link to the gravatar service" do
      should match "gravatar.com"
    end

    { "chad.ostrowski@gmail.com" => "259469ed60f945161a150e79a381b26c",
      "hi@chadoh.com" => "1d2d939c88abd55ab24736f272bbe323"
    }.each do |email, md5|
      it "md5's email address '#{email}' correctly" do
        user.email = email
        should match md5
      end
    end

    it "defaults to wavatars if gravatar isn't found" do
      should match "d=wavatar"
    end

    it "specifies the size" do
      should match "s="
    end

    it "puts an img in a .avatar div" do
      should match /avatar.+<img/
    end
  end
end
