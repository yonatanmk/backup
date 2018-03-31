require "spec_helper"

describe Lesson do

  let(:lesson) { Lesson.new("Inheritance", "Inheritance is hard") }

  describe ".new" do
    it "takes a name and body as arguments" do
      expect(lesson).to be_a(Lesson)
    end
  end

  describe "#name" do
    it "has a reader for name" do
      expect(lesson.name).to eq("Inheritance")
    end

    it "has a writer for name" do
      lesson.name = "Rabbits"
      expect(lesson.name).to eq("Rabbits")
    end
  end

  describe "#body" do
    it "has a reader for body" do
      expect(lesson.body).to eq("Inheritance is hard")
    end

    it "has a writer for body" do
      lesson.body = "I like bunnies!"
      expect(lesson.body).to eq("I like bunnies!")
    end
  end

  describe "#submittable?" do
    it "returns false" do
      expect(lesson.submittable?).to eq(false)
    end
  end
end
