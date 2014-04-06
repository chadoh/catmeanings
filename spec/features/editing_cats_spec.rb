require 'spec_helper'

feature "Editing a cat" do
  let(:cat) { create :cat }
  let(:user) { cat.user }

  scenario "I get redirected if I try to edit a cat that I didn't create" do
    sign_in user
    visit edit_cat_path(cat)

    expect(current_path).to eq "/"
  end
end
