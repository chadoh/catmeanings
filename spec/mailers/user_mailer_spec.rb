require "spec_helper"

describe UserMailer do
  let(:user)  { build :user }

  describe :welcome do
    let(:mail) { UserMailer.welcome(user) }

    it "renders the headers" do
      mail.subject.should match("Welcome")
      mail.to.should eq([user.email])
      mail.from.should eq(["support@catmeanings.com"])
    end

    it "contains a link to set up a password" do
      mail.body.encoded.should match(user.password_reset_token)
      mail.body.encoded.should match("Click here to set your password</a>")
    end
  end

  describe :password_reset do
    let(:mail) { UserMailer.password_reset(user) }

    it "renders the headers" do
      mail.subject.should eq("Password Reset")
      mail.to.should eq([user.email])
      mail.from.should eq(["support@catmeanings.com"])
    end

    it "contains a link to reset the user's password" do
      mail.body.encoded.should match(user.password_reset_token)
      mail.body.encoded.should match("Click here to reset your password</a>")
    end
  end

end
