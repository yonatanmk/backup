class Event
  attr_reader :name, :venue, :url, :start_time, :type

  def initialize(name, venue, url, time, type)
    @name = name
    @venue = venue
    @url = url
    @start_time = time
    @type = type
  end
end
