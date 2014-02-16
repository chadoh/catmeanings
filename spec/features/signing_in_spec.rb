require "spec_helper"

feature "signing in" do
  scenario "I sign in unsuccessfully" do
    visit signin_path
    within("#main") do
      fill_in "Email", with: "what@ever.com"
      fill_in "Password", with: "nope"
      click_button "Sign In"
    end

    expect(page).to have_content "invalid"
  end
end
