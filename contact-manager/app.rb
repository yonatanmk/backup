require 'sinatra'
require 'sinatra/reloader'
require "sinatra/activerecord"
require 'Pry'

require_relative 'models/contact'
also_reload 'models/contact'

set :bind, '0.0.0.0'  # bind to all interfaces

get '/' do
  @contacts = Contact.all
  # @contacts.each do |contact|
  #   binding.pry
  # end
  erb :index
end

get '/contacts/page/:id' do
  @current_page = params[:id].to_i
  @contacts = Contact.limit(3).offset(params[:id].to_i*3-3)
  @contacts_length = Contact.all.length
  @prev_page = @current_page - 1
  @prev_page = 1 if params[:id].to_i == 1
  @next_page = @current_page + 1
  @next_page = (@contacts_length / 3.0).ceil if params[:id].to_i == (@contacts_length / 3.0).ceil
  erb :page
end

get '/contacts' do
  redirect '/contacts/page/1'
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :show
end

get '/search' do
  erb :search
end

get '/add' do
  @error_msg = ""
  @success_msg = ""
  erb :add
end

post '/add' do
  @first_name = params['first_name'].downcase.capitalize
  @last_name = params['last_name'].downcase.capitalize
  @phone = params['phone']
  @error_msg = ""
  @success_msg = ""
  if @phone.length != 10
    @success_msg = ""
    @error_msg = "Phone number must be 10 characters long."
    erb :add
  else
    @error_msg = ""
    @success_msg = "Contact added."
    Contact.create(first_name: @first_name, last_name: @last_name, phone_number: @phone)
    erb :add
  end
end

get '/delete' do
  @error_msg = ""
  @success_msg = ""
  erb :delete
end

post '/delete' do
  @first_name = params['first_name'].downcase.capitalize
  @last_name = params['last_name'].downcase.capitalize
  @success_msg = ""
  contact = Contact.where(first_name: @first_name, last_name: @last_name)
  if contact.length > 0
    @error_msg = ""
    @success_msg = "Contact deleted."
    contact.delete_all
    erb :delete
  else
    @success_msg = ""
    @error_msg = "Contact not found."
    erb :delete
  end
end

get '/search/:queries' do
  @first_name = params['first_name'].downcase.capitalize
  @last_name = params['last_name'].downcase.capitalize
  if @first_name.length > 0 && @last_name.length > 0
    @contacts = (Contact.where(first_name: @first_name, last_name: @last_name))
  else
  #ask if i can use a WHERE OR somehow
  @contacts = (Contact.where(first_name: @first_name) + Contact.where(last_name: @last_name)).uniq
  end
  erb :search_result
end
