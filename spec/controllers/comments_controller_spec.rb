require 'spec_helper'

describe CommentsController do
  let(:comment) { create :comment }
  let(:user) { comment.user }

  it "only allows the comment creator to update it" do
    # Given
    user2 = create :user
    original_text = comment.text
    controller.stub(:current_user).and_return(user2)

    # When
    xhr :patch, :update, id: comment.id, comment: { text: original_text + " MANGOES!" }

    # Then
    expect(response.code).to eq "401"
    expect(comment.reload.text).to eq original_text
  end

  it "only allows the comment creator to delete it" do
    # Given
    user2 = create :user
    controller.stub(:current_user).and_return(user2)

    # When
    xhr :delete, :destroy, id: comment.id

    # Then
    expect(response.code).to eq "401"
    expect { comment.reload }.not_to raise_error
  end
end
