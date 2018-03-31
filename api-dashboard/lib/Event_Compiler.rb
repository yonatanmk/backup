require "net/http"
require "json"
require 'Pry'

class Event_Compiler
  attr_reader :date, :events
  def initialize(latitude, longitude, secret, id)
    @latitude = latitude
    @longitude = longitude
    @date = Date.today.to_s[0..9]
    @secret = secret
    @id = id
    @data = get_info
    @events = []
    add_events
  end

  private

  def get_info
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)['events']
  end

  def add_events
    @data.each do |event|
      # binding.pry
      @events << Event.new(event['title'], event['venue']['name'], event['url'], event['datetime_local'][-8..-1], event['type'])
      # binding.pry
    end
  end

  def uri
    URI("https://api.seatgeek.com/2/events?venue.city=#{'boston'}&datetime_utc.gte=#{Date.today.prev_day.to_s[0..9]}&client_id=NjQyNzQ0OXwxNDgxNzU2NDMx&client_secret=m6Gn7Tpot7jHAo5-yRAFHU6j76EB2scp13RfTHSs")
  end

end
