require 'spec_helper'

RSpec.describe Leaderboard do
  subject(:leaderboard) {leaderboard = Leaderboard.new}
  let(:team_list) {team_list = Leaderboard.new.teams}
  let(:best_team) do
    best_team = team_list[0]
    team_list.each do |team|
      if (team.wins - team.losses) > (best_team.wins - best_team.losses)
        best_team = team
      end
    end
    best_team
  end
  describe ".new" do
    it 'creates a teams list 4 units long' do
      expect(team_list.length).to eq(4)
    end
    it 'created teams list contains all the teams' do
      ["Patriots", "Broncos", "Colts", "Steelers"].each do |team_name|
        team = team_list.find { |team| team.name == team_name }
        expect(team).not_to eq(nil)
      end
    end
    it 'gives each team the appropriate number of wins/losses' do
      sample_team = team_list.find {|team| team.name == 'Broncos'}
      expect(sample_team.wins).to eq(1)
      expect(sample_team.losses).to eq(2)
    end
  end

  describe "#make_team_list" do
    it 'creates a teams list 4 units long' do
      expect(leaderboard.make_team_list.length).to eq(4)
    end
    it 'created teams list contains all the teams' do
      ["Patriots", "Broncos", "Colts", "Steelers"].each do |team_name|
        team = leaderboard.make_team_list.find do |team|
          team.name == team_name
        end
        expect(team).not_to eq(nil)
      end
    end
  end

  describe '#sort_teams' do
    it 'sorts teams in order of wins' do
      expect(team_list[0]).to eq(best_team)
    end
    it 'best team has rank 1' do
      expect(best_team.rank).to eq(1)
    end
  end

  describe '#display' do
    it 'outputs the correct board' do
      board = "------------------------------------------------------\n"
      board += "| Name\t\tRank\tTotal Wins\tTotal Losses |\n"
      board += "| Patriots\t1\t3\t\t0\t     |\n"
      board += "| Steelers\t2\t1\t\t1\t     |\n"
      board += "| Broncos\t3\t1\t\t2\t     |\n"
      board += "| Colts\t\t4\t0\t\t2\t     |\n"
      board += "------------------------------------------------------\n"
      expect{leaderboard.display}.to output(board).to_stdout
    end
  end

  describe '#team_game_summary' do
    it 'reports the correct game summary for the patriots' do
      output = "The Patriots played 3 games.\n"
      output += "They played as the home team against the Broncos and won: 17 to 13.\n"
      output += "They played as the home team against the Colts and won: 21 to 17.\n"
      output += "They played as the away team against the Steelers and won: 31 to 24.\n"
      expect{leaderboard.team_game_summary('Patriots')}.to output(output).to_stdout
    end
  end

end
