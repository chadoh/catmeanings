require 'spec_helper'

describe CatsController do
  let(:cat) { create :cat }
  let(:user) { cat.user }

  it "only allows the cat creator to edit it" do
    # Given
    user2 = create :user
    controller.stub(:current_user).and_return(user2)

    # When
    get :edit, id: cat.id

    # Then
    expect(response).to redirect_to('/')
  end

  it "only allows the cat creator to update it" do
    # Given
    user2 = create :user
    original_name = cat.name
    controller.stub(:current_user).and_return(user2)

    # When
    patch :update, id: cat.id, cat: { name: original_name + " MANGOES!" }

    # Then
    expect(cat.reload.name).to eq original_name
    expect(response).to redirect_to('/')
  end

  it "only allows the cat creator to delete it" do
    # Given
    user2 = create :user
    controller.stub(:current_user).and_return(user2)

    # When
    delete :destroy, id: cat.id

    # Then
    expect { cat.reload }.not_to raise_error
    expect(response).to redirect_to('/')
  end

  describe "#index" do
    it "loads all cats by default" do
      cat # instantiate

      get :index

      expect(assigns(:cats)).to eq [cat]
    end

    it "scopes to a certain user's cats if given a user_id param" do
      cat # instantiate
      user2 = create :user

      get :index, user: user2.id

      expect(assigns(:cats)).to be_empty
    end

    it "allows searching, finding cats by name or caption" do
      cat # instantiate
      cat2 = create :cat

      get :index, q: cat2.name

      expect(assigns(:cats).length).to eq 1
    end
  end
end
