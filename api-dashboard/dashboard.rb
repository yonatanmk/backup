require "./lib/Geolocation"
require "./lib/Weather"
require "./lib/News"
require "./lib/Article"
require "./lib/Event_Compiler"
require "./lib/Event"
require "sinatra/base"

require "dotenv"
Dotenv.load

class Dashboard < Sinatra::Base
  get("/") do
    @ip = request.ip
    @geolocation = Geolocation.new(@ip)
    erb :dashboard
  end

  get("/weather") do
    @ip = request.ip
    @geolocation = Geolocation.new(@ip)
    @weather = Weather.new(@geolocation.lat, @geolocation.long, ENV["DARKSKY_API_KEY"])
    erb :weather
  end

  get("/news") do
    @news = News.new('90833ef9f3494d1688bcf9ba765417d8')
    erb :news
  end

  get("/events") do
    @ip = request.ip
    @geolocation = Geolocation.new(@ip)
    @events = Event_Compiler.new(@geolocation.lat, @geolocation.long, ENV["SEATGEEK_CLIENT_SECRET"], ENV["SEATGEEK_CLIENT_ID"])
    erb :events
  end
end
