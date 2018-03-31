class Album
  attr_reader :id, :title, :artists, :tracks

  def initialize(id, title, artists)
    @id = id
    @title = title
    @artists = artists
    @tracks = []
  end

  def duration_min
    total = @tracks.reduce(0) do |sum, track|
      sum + track.duration_ms.to_f/60_000
    end
    return sprintf('%0.2f', total)
  end

  def summary
    summary = "Name: #{@title}\n"
    summary += "Artist(s): #{@artists}\n"
    summary += "Duration (min.): #{self.duration_min}\n"
    summary += "Tracks:\n"
    @tracks.each {|track| summary += "- #{track.title}\n"}
    return summary + "\n"
  end

end
