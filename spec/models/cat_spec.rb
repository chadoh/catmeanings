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

  describe "#user" do
    let(:cat) { create :cat }

    it "returns the related user" do
      expect(cat.user).to be_kind_of User
    end
  end

  describe '.matching' do
    it "returns cats with a name partially matching the given term" do
      cat = create :cat, name: "pigglity wigglity"

      expect(Cat.matching "wigglity").to eq [cat]
    end

    it "returns cats with a caption partially matching the given term" do
      cat = create :cat, caption: "pigglity wigglity"

      expect(Cat.matching "wigglity").to eq [cat]
    end

    it "searches case insensitively" do
      cat = create :cat, name: "PiggliTY WIGglity"

      expect(Cat.matching "wigglity").to eq [cat]
    end
  end
end
