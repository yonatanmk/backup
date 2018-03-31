class Article
  attr_reader :headline, :url, :lead_paragraph, :type

  def initialize(headline, url, lead_paragraph, type)
    @headline = headline
    @url = url
    @lead_paragraph = lead_paragraph
    @type = type
  end
end
