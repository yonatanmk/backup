require 'HTTParty'
require 'Pry'
require 'date'

response = HTTParty.get("https://api.seatgeek.com/2/events?venue.city=#{ARGV[0]}&datetime_utc.gte=#{Date.today.prev_day.to_s[0..9]}&client_id=NjQyNzQ0OXwxNDgxNzU2NDMx&client_secret=m6Gn7Tpot7jHAo5-yRAFHU6j76EB2scp13RfTHSs")
events = response['events']
binding.pry
events.each do |event|
  puts "#{event['title']} @ #{event['venue']['name']}"
  #puts event['datetime_local']
end
