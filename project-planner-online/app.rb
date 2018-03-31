require "sinatra"
require_relative "config/application"
require 'Pry'

set :bind, '0.0.0.0'  # bind to all interfaces

get '/' do
  redirect '/projects'
end

get '/projects' do
  @projects = Project.all
  erb :'projects'
end

get '/projects/:id' do
  @project = Project.find(params['id'])
  erb :'show'
end
