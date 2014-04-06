require "spec_helper"

feature "A user edits her account info" do
  let(:name) { "wilma" }
  let(:email) { "#{name}@catmeanings.com" }
  let(:password) { "secret" }

  let(:user) { create :user }

  scenario "updating username & email address" do
    sign_in user
    click_on "Edit Your Account"

    within("#main") do
      fill_in "Username", with: name
      fill_in "Email", with: email
      click_on "Update Email"
    end

    expect(page).to have_content name
    expect(user.reload.email).to eq email
  end

  scenario "updating password" do
    sign_in user
    click_on "Edit Your Account"

    fill_in "New password", with: password
    fill_in "New password confirmation", with: password
    click_on "Update Password"

    sign_out_and_in_again user.email, password
    expect(page).to have_content user.to_s
  end

  scenario "deleting account" do
    sign_in user
    click_on "Edit Your Account"

    click_on "Delete Account"

    expect(User.count).to eq 0
  end
end
