require "sinatra"
require "pry"
require "csv"

set :bind, '0.0.0.0'

def make_grocery_list ()
  groceries = []
  CSV.foreach('grocery_list.csv') do |row|
    groceries << row
  end
  return groceries
end

get '/' do
  redirect '/grocery-list'
end

get '/grocery-list' do
  @groceries = make_grocery_list
  @error = false
  erb :index
end

get "/grocery-list/:item" do
  groceries = make_grocery_list
  @item = params[:item][1..params[:item].length-1]
  @quantity = groceries.find {|item|  item[0] == @item}[1]
  erb :show
end

post '/grocery-list' do
  @item = params['item']
  @quantity = params['quantity']
  input_array = [@item, @quantity]
  if @item == ""
    @groceries = make_grocery_list
    @error = true
    erb :index
  else
    CSV.open('grocery_list.csv', 'a', headers: true) do |csv|
      csv << input_array
    end
    redirect '/grocery-list'
  end
end
