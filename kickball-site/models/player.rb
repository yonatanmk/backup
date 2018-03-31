require_relative "./team_data"
require 'pry'

class Player
  attr_reader :name, :position, :team_name

  @@instances = []

  def initialize(name, position, team_name)
    @@instances << self

    @name = name
    @position = position
    @team_name = team_name
  end

  def self.all
    return @@instances
  end

end
