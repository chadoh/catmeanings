require 'spec_helper'

describe Comment do
  let(:comment) { build :comment }

  describe "#user" do
    it "returns the related user" do
      expect(comment.user).to be_kind_of User
    end
  end

  describe "#cat" do
    it "returns the related cat" do
      expect(comment.cat).to be_kind_of Cat
    end
  end
end
