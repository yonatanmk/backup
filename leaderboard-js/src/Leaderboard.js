const gameInfo = [
  {
    home_team: 'Patriots',
    away_team: 'Broncos',
    home_score: 7,
    away_score: 3
  },
  {
    home_team: 'Broncos',
    away_team: 'Colts',
    home_score: 3,
    away_score: 0
  },
  {
    home_team: 'Patriots',
    away_team: 'Colts',
    home_score: 11,
    away_score: 7
  },
  {
    home_team: 'Steelers',
    away_team: 'Patriots',
    home_score: 7,
    away_score: 21
  }
];

// YOUR CODE HERE
//import {Team} from './';
let Team = require('./Team.js');

// class Team {
//   constructor (name) {
//     this.name = name;
//     this.rank = undefined;
//     this.wins = 0;
//     this.losses = 0;
//   }
// }

class Leaderboard {
  constructor (gameInfo) {
    this.gameInfo = gameInfo;
    this.teams = this.makeTeamList();
    this.setWinsAndLosses();
    this.sortTeams();
  }

  makeTeamList() {
    let arr = [];
    for (let game of this.gameInfo) {
      if (!arr.find(function(team){
        return team.name === game.home_team;
      })) {
        arr.push(new Team (game.home_team));
      }
      if (!arr.find(function(team){
        return team.name === game.away_team;
      })) {
        arr.push(new Team (game.away_team));
      }
    }
    return arr;
  }

  setWinsAndLosses() {
    for (let game of this.gameInfo) {
      if (game.home_score > game.away_score) {
        this.teams.find(function(team){
          return team.name === game.home_team;
        }).wins += 1;
        this.teams.find(function(team){
          return team.name === game.away_team;
        }).losses += 1;
      }
      else {
        this.teams.find(function(team){
          return team.name === game.home_team;
        }).losses += 1;
        this.teams.find(function(team){
          return team.name === game.away_team;
        }).wins += 1;
      }
    }
  }

  sortTeams() {
    this.teams = this.teams.sort(function(a, b){
      return (b.wins - b.losses) - (a.wins - a.losses);
    });
    for (let i = 0; i < this.teams.length; i++) {
      this.teams[i].rank = i + 1;
    }
  }

  display() {
    let output = `------------------------------------------------------\n`;
    output += "| Name\t\tRank\tTotal Wins\tTotal Losses |\n";
    for (let team of this.teams) {
      output += '| ';
      if (team.name.length > 5) {
        output += `${team.name}\t`;
      }
      else {
        output += `${team.name}\t\t`;
      }
      output += `${team.rank}\t`;
      output += `${team.wins}\t\t`;
      output += `${team.losses}\t`;
      output += `     |\n`;
    }
    output += `------------------------------------------------------\n`;
    console.log(output);
  }
}

let leaderboard = new Leaderboard (gameInfo);
leaderboard.display();
