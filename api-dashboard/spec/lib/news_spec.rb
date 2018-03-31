require "spec_helper"

RSpec.describe News, vcr: { cassette_name: "news" } do
  let(:news) { News.new(ENV["NY_TIMES_API_KEY"]) }

  describe '#initialize' do
    it 'accepts key argument and initializes correctly' do
      expect(news).to be_a(News)
    end

    it '@articles contains articles' do
      expect(news.articles[0]).to be_a(Article)
    end

    it '@articles contains at least 10 articles' do
      expect(news.articles.length >= 10).to eq(true)
    end
  end

end
