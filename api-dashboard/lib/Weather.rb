require "net/http"
require "json"
require 'Pry'

class Weather
  def initialize(latitude, longitude, key)
    @latitude = latitude
    @longitude = longitude
    @key = key
    @data = get_info
  end

  def summary
    return get_info["currently"]["summary"]
  end

  def temp
    return get_info["currently"]["temperature"]
  end

  def icon
    return get_info["currently"]["icon"]
  end

  private

  def get_info
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

  def uri
    URI("https://api.darksky.net/forecast/#{@key}/#{@latitude},#{@longitude}")
    #URI("https://api.darksky.net/forecast/d11fc927eddfbc963ae92f948c52d8d8/#{@latitude},#{@longitude}")
  end

  # def default_weather
  #   {"currently"=>
  #     {"time"=>1481825188,
  #       "summary"=>"Partly Cloudy",
  #       "icon"=>"partly-cloudy-day",
  #       "nearestStormDistance"=>25,
  #       "nearestStormBearing"=>202,
  #       "precipIntensity"=>0,
  #       "precipProbability"=>0,
  #       "temperature"=>25.68,
  #       "apparentTemperature"=>12.7,
  #       "dewPoint"=>2.08,
  #       "humidity"=>0.35,
  #       "windSpeed"=>17.07,
  #       "windBearing"=>287,
  #       "visibility"=>10,
  #       "cloudCover"=>0.44,
  #       "pressure"=>1005.41,
  #       "ozone"=>378.29
  #     }
  #   }
  # end

end
