require "sinatra"
require_relative "models/player"
require_relative "models/team"
require_relative "models/team_data"
require "pry"

set :bind, '0.0.0.0'  # bind to all interfaces

teams = []

TeamData::ROLL_CALL.each do |team_name, info|
  players = []
  info.each do |position, player_name|
    players << Player.new(player_name, position, team_name)
  end
  team = Team.new(team_name.to_s, players)
  teams << team
end

get "/" do
  "<h1>The LACKP Homepage<h1>"
end

get "/teams" do
  @team_names = []
  Team.all.each do |team|
    @team_names << team.team_name
  end
  erb :index
end

get "/teams/:team_name" do
  @team = teams.find {|team| team.team_name.to_s == params[:team_name]}
  erb :show
end

get "/positions" do
  @positions = teams[0].players.map {|player| player.position}
  erb :positions
end

get "/positions/:position" do
  @position = params[:position]
  @players = Player.all.select {|player| player.position.to_s == @position}
  erb :position_list
end
