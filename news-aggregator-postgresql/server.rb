require "sinatra"
require "pg"
require_relative "./app/models/article"
require 'Pry'

set :bind, '0.0.0.0'  # bind to all interfaces
set :views, File.join(File.dirname(__FILE__), "app", "views")

configure :development do
  set :db_config, { dbname: "news_aggregator_development" }
end

configure :test do
  set :db_config, { dbname: "news_aggregator_test" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

# Put your News Aggregator server.rb route code here
get '/articles' do
  @articles = []
  db_connection do |conn|
    @articles = conn.exec('SELECT * FROM articles')
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
  # should begin with http://
  article_data = [@article_title, @article_description, @article_url]
  @error_msg = ""
  @db_contains = false
  url_list = nil
  db_connection do |conn|
    url_list = conn.exec('SELECT url FROM articles')
  end
  url_list.each do |url|
    @db_contains = true if url['url'] == @article_url
  end
  if article_data.include?('')
    @error_msg = "Please fill out all fields"
    erb :new
  elsif @db_contains
    @error_msg = "That url has already been posted"
    erb :new
  else
    db_connection do |conn|
      conn.exec_params(
        'INSERT INTO articles (title, url, description) VALUES ($1, $2, $3)',
        [@article_title, @article_url, @article_description]
      )
    end
    redirect '/articles'
  end
end

# db_connection do |conn|
#   # iterate over CSV data
#   csv_records.each do |record|
#     construction_type = record["construction_type"]
#     zoning_type = record["zoning_type"]
#
#     # determine if construction type exists in database
#     construction_type_results = conn.exec_params(
#       'SELECT name FROM construction_types WHERE name=$1',
#       [construction_type]
#     )
#
#     # if there are no results
#     if construction_type_results.to_a == []
#       conn.exec_params(
#         'INSERT INTO zoning_types (name) VALUES ($1)',
#         [zoning_type]
#       )
#     end
#
#     # determine if zoning type exists in database
#     zoning_type_results = conn.exec_params(
#       'SELECT name FROM zoning_types WHERE name=$1',
#       [zoning_type]
#     )
#
#     # if there are no results
#     if zoning_type_results.to_a == []
#       conn.exec_params(
#         'INSERT INTO zoning_types (name) VALUES ($1)',
#         [zoning_type]
#       )
#     end
#   end
# end
