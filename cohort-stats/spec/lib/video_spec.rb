require "spec_helper"

describe Video do

  let(:video) { Video.new("Inheritance", "Inheritance is hard", "https://learn.launchacademy.com/lessons/cohort-stats") }

  describe ".new" do
    it "takes a name, body, and url as arguments" do
      expect(video).to be_a(Video)
    end
  end

  describe "#name" do
    it "has a reader for name" do
      expect(video.name).to eq("Inheritance")
    end

    it "has a writer for name" do
      video.name = "Rabbits"
      expect(video.name).to eq("Rabbits")
    end
  end

  describe "#body" do
    it "has a reader for body" do
      expect(video.body).to eq("Inheritance is hard")
    end

    it "has a writer for body" do
      video.body = "I like bunnies!"
      expect(video.body).to eq("I like bunnies!")
    end
  end

  describe "#url" do
    it "has a reader for url" do
      expect(video.url).to eq("https://learn.launchacademy.com/lessons/cohort-stats")
    end

    it "does not have a writer for url" do
      expect{video.url = "google.com"}.to raise_error(NoMethodError)
    end
  end

  describe "#submittable?" do
    it "returns false" do
      expect(video.submittable?).to eq(false)
    end
  end
end
