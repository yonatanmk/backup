require "net/http"
require "json"
require 'Pry'
require 'date'

class News
  attr_reader :articles
  def initialize(key)
    @key = key
    @date = Date.today.to_s.gsub(/-/,"")
    @data = get_info
    @articles = []
    add_articles
  end

  private

  def get_info
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)["response"]["docs"]
  end

  def add_articles
    @data.each do |article|
      # binding.pry
      @articles << Article.new(article['headline']['main'],article['web_url'],article['lead_paragraph'],article['document_type'])
      # binding.pry
    end
  end

  def uri
    URI("https://api.nytimes.com/svc/search/v2/articlesearch.json?api-key=#{@key}&begin_date=20161215")
  end



end
