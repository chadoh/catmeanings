require 'spec_helper'

feature "Signing up" do

  let(:email) { "hi@chadoh.com" }
  let(:password) { "secret" }
  let(:user) { User.first }

  context "when the email address is not already taken" do
    before do
      visit "/signin"
      within("#new_user") do
        fill_in "Email", with: email
        click_on "Get Started"
      end
    end

    it "creates a user and signs them in" do
      expect(User.first.email).to eq email

      expect(page).to have_content user.to_s
    end

    it "sends the new user an email that lets them set their password" do
      open_email(email)
      expect(current_email.subject).to match "Welcome"
      current_email.click_on "Click here to set your password"

      expect(page).to have_content "Set Password"
      within("#main") do
        fill_in "Password", with: password
        fill_in "Password confirmation", with: password
        click_on "Save"
      end

      sign_out_and_in_again email, password
      expect(page).to have_content user.to_s
    end
  end

end
