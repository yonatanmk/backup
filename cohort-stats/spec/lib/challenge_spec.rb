require "spec_helper"

describe Challenge do

  let(:challenge) { Challenge.new("Inheritance", "Inheritance is hard") }

  describe ".new" do
    it "takes a name and body as arguments" do
      expect(challenge).to be_a(Challenge)
    end
  end

  describe "#name" do
    it "has a reader for name" do
      expect(challenge.name).to eq("Inheritance")
    end

    it "has a writer for name" do
      challenge.name = "Rabbits"
      expect(challenge.name).to eq("Rabbits")
    end
  end

  describe "#body" do
    it "has a reader for body" do
      expect(challenge.body).to eq("Inheritance is hard")
    end

    it "has a writer for body" do
      challenge.body = "I like bunnies!"
      expect(challenge.body).to eq("I like bunnies!")
    end
  end

  describe "#submittable?" do
    it "returns true" do
      expect(challenge.submittable?).to eq(true)
    end
  end
end
