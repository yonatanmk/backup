require "spec_helper"

RSpec.describe Article do
  let(:article) { Article.new('Headline', 'url', 'paragraph', 'type') }

  describe '#initialize' do
    it 'accepts 4 arguments and initializes correctly' do
      expect(article).to be_a(Article)
    end

    it 'has a headline' do
      expect(article.headline).to eq('Headline')
    end

    it 'has a url' do
      expect(article.url).to eq('url')
    end

    it 'has a lead paragraph' do
      expect(article.lead_paragraph).to eq('paragraph')
    end

    it 'type' do
      expect(article.type).to eq('type')
    end
  end


end
