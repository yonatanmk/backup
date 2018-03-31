require "sinatra"
require "pry"
require "csv"

set :bind, '0.0.0.0'

get '/articles' do
  @articles = []

  CSV.foreach('article_list.csv') do |article|
    @articles << article
  end
  erb :index
end

get '/articles/new' do
  @error_msg = ""
  erb :new
end

post '/articles/new' do
  @article_title = params[:article_title]
  @article_description = params[:article_description]
  @article_url = params[:article_url]
  article_data = [@article_title, @article_description, @article_url]
  @error_msg = ""
  @csv_contains = false
  CSV.foreach('article_list.csv', 'r') do |row|
    @csv_contains = row[2] == @article_url
  end
  if article_data.include?('')
    @error_msg = "Please fill out all fields"
    erb :new
  elsif @csv_contains
    @error_msg = "That url has already been posted"
    erb :new
  else
    CSV.open('article_list.csv', 'a') do |csv_obj|
      csv_obj << article_data
    end
    redirect '/articles'
  end
end
