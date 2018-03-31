require "spec_helper"

describe Article do

  let(:article) { Article.new("Inheritance", "Inheritance is hard") }

  describe ".new" do
    it "takes a name and body as arguments" do
      expect(article).to be_a(Article)
    end
  end

  describe "#name" do
    it "has a reader for name" do
      expect(article.name).to eq("Inheritance")
    end

    it "has a writer for name" do
      article.name = "Rabbits"
      expect(article.name).to eq("Rabbits")
    end
  end

  describe "#body" do
    it "has a reader for body" do
      expect(article.body).to eq("Inheritance is hard")
    end

    it "has a writer for body" do
      article.body = "I like bunnies!"
      expect(article.body).to eq("I like bunnies!")
    end
  end

  describe "#submittable?" do
    it "returns false" do
      expect(article.submittable?).to eq(false)
    end
  end
end
