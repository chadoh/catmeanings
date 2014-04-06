require "spec_helper"

feature "Resetting your password" do
  let(:user)  { create(:user) }

  scenario "I reset my password from the sign-in form" do
    visit "/signin"
    click_link "Reset your password"
    within("#main") do
      fill_in "Email", with: user.email
      click_on "Reset Password"
    end

    open_email(user.email)
    expect(current_email.subject).to match "Password Reset"
    current_email.click_on "Click here to reset your password"

    expect(page).to have_selector "input[value='#{user.email}'][disabled]"
    within("#main") do
      fill_in "Password", with: "secret"
      fill_in "Password confirmation", with: "secret"
      click_on "Save"
    end

    expect(page).to have_content user.to_s
  end
end
