require 'spec_helper'

describe UsersController do
  let(:user) { create :user }

  describe "#dumb_update" do
    let(:email) { "other@example.com" }
    before do
      controller.stub(:current_user).and_return(user)

      get :dumb_update, user: { email: email }
    end

    it "updates the currently logged in user with a get request" do
      expect(user.reload.email).to eq email
    end

    it "redirects to editing account" do
      expect(response).to redirect_to(edit_user_path(user))
    end
  end
end
