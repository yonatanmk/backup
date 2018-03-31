require_relative "./team_data"

class Team
  attr_reader :team_name, :players

  @@instances = []

  def initialize(team_name, players)
    @@instances << self
    @team_name = team_name
    @players = players
  end

  def self.all
    return @@instances
  end

end
