require 'sinatra'
require_relative 'config/application'
require 'Pry'

set :bind, '0.0.0.0'  # bind to all interfaces

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.order("lower(name) ASC") #.order(name: :asc)
  erb :'meetups/index'
end

get '/meetups/new' do
  erb :'meetups/new'
end

post '/meetups/new' do
  name = params['name']
  description = params['description']
  location = params['location']
  user_id = session[:user_id]
  Meetup.create(name: name, description: description, location: location, creator_id: user_id)
  UserMeetup.create(user_id: user_id, meetup_id: Meetup.last.id)
  erb :'meetups/new'
end

get '/meetups/:id' do
  @id = params['id']
  @meetup = Meetup.find(@id)
  @creator = @meetup.creator
  @attendees = @meetup.attendees
  @user_in_attendance = @attendees.include?(User.find_by(id: session[:user_id]))
  erb :'meetups/show'
end

post '/meetups/:id' do
  id = params['id']
  user_id = session[:user_id]
  if params['action'] == 'join'
    UserMeetup.create(user_id: user_id, meetup_id: id)
  else
    users = UserMeetup.where(user_id: user_id, meetup_id: id)
    users.delete_all
  end
  redirect :"/meetups/#{id}"
end
