require 'Pry'
class Leaderboard
GAME_INFO = [
    {
      home_team: "Patriots",
      away_team: "Broncos",
      home_score: 17,
      away_score: 13
    },
    {
      home_team: "Broncos",
      away_team: "Colts",
      home_score: 24,
      away_score: 7
    },
    {
      home_team: "Patriots",
      away_team: "Colts",
      home_score: 21,
      away_score: 17
    },
    {
      home_team: "Broncos",
      away_team: "Steelers",
      home_score: 11,
      away_score: 27
    },
    {
      home_team: "Steelers",
      away_team: "Patriots",
      home_score: 24,
      away_score: 31
    }
]

# YOUR CODE GOES HERE
  require_relative ('team.rb')
  attr_reader :teams, :team_names

  def initialize
    @teams = self.make_team_list
    self.set_wins_and_losses
    self.sort_teams
  end

  def make_team_list
    array = []
    GAME_INFO.each do |game|
      unless array.find {|team| team.name == game[:home_team]}
        array << Team.new(game[:home_team])
      end
      unless array.find {|team| team.name == game[:away_team]}
        array << Team.new(game[:away_team])
      end
    end
    return array
  end

  def set_wins_and_losses
    GAME_INFO.each do |game|
      if game[:home_score] > game[:away_score]
        @teams.find{|team| team.name == game[:home_team]}.wins += 1
        @teams.find{|team| team.name == game[:away_team]}.losses += 1
      else
        @teams.find{|team| team.name == game[:home_team]}.losses += 1
        @teams.find{|team| team.name == game[:away_team]}.wins += 1
      end
    end
  end

  def sort_teams
    @teams.sort!{|a,b| (b.wins - b.losses) <=> (a.wins - a.losses) }
    @teams.each_with_index {|team, i| team.rank = i + 1}
  end

  def display
    puts '------------------------------------------------------'
    puts "| Name\t\tRank\tTotal Wins\tTotal Losses |"
    @teams.each do |team|
      print '| '
      if team.name.length > 5
        print "#{team.name}\t"
      else
        print "#{team.name}\t\t"
      end
      print "#{team.rank}\t"
      print "#{team.wins}\t\t"
      print "#{team.losses}\t"
      puts '     |'
    end
    puts '------------------------------------------------------'
  end

  def team_game_summary(team_name)
    game_count = 0
    GAME_INFO.each do |game|
      if game[:home_team] == team_name || game[:away_team] == team_name
        game_count += 1
      end
    end
    puts "The #{team_name} played #{game_count} games."
    GAME_INFO.each do |game|
      if game[:home_team] == team_name || game[:away_team] == team_name
        print "They played as the "
        if game[:home_team] == team_name
          print "home team against the #{game[:away_team]} and "
          if game[:home_score] > game[:away_score]
            puts "won: #{game[:home_score]} to #{game[:away_score]}."
          else
            puts "lost: #{game[:home_score]} to #{game[:away_score]}."
          end
        else
          print "away team against the #{game[:home_team]} and "
          if game[:home_score] > game[:away_score]
            puts "lost: #{game[:away_score]} to #{game[:home_score]}."
          else
            puts "won: #{game[:away_score]} to #{game[:home_score]}."
          end
        end
      end
    end
  end
end

# a = Leaderboard.new
# a.display
# puts
# a.team_game_summary('Patriots')
# puts
# a.team_game_summary('Monkees')
# puts
# a.team_game_summary('Broncos')
