require 'spec_helper'

describe Cat do
  let(:cat) { build :cat }

  describe "#to_s" do
    it "returns the `name`" do
      expect(cat.to_s).to eq cat.name
    end
  end

  describe "#comments" do
    it "returns the related comments" do
      expect(cat.comments).to eq []
    end
  end
end
