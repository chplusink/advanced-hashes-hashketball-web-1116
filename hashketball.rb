require "pry"

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {number:0, shoe:16, points:22, rebounds:12, assists:12, steals:3, blocks:1, slam_dunks:1},
        "Reggie Evans" => {number:30, shoe:14, points:12, rebounds:12, assists:12, steals:12, blocks:12, slam_dunks:7},
        "Brook Lopez" => {number:11, shoe:17, points:17, rebounds:19, assists:10, steals:3, blocks:1, slam_dunks:15},
        "Mason Plumlee" => {number:1, shoe:19, points:26, rebounds:12, assists:6, steals:3, blocks:8, slam_dunks:5},
        "Jason Terry" => {number:31, shoe:15, points:19, rebounds:2, assists:2, steals:4, blocks:11, slam_dunks:1}
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {number:4, shoe:18, points:10, rebounds:1, assists:1, steals:2, blocks:7, slam_dunks:2},
        "Bismak Biyombo" => {number:0, shoe:16, points:12, rebounds:4, assists:7, steals:7, blocks:15, slam_dunks:10},
        "DeSagna Diop" => {number:2, shoe:14, points:24, rebounds:12, assists:12, steals:4, blocks:5, slam_dunks:5},
        "Ben Gordon" => {number:8, shoe:15, points:33, rebounds:3, assists:2, steals:1, blocks:1, slam_dunks:0},
        "Brendan Haywood" => {number:33, shoe:15, points:6, rebounds:12, assists:12, steals:22, blocks:5, slam_dunks:12}
      }
    }
  }
end

def num_points_scored(player)
  player_stats(player).fetch(:points)
end

def shoe_size(player)
  player_stats(player).fetch(:shoe)
end

def team_colors(team)
  find_team(team).fetch(:colors)
end

def team_names
  all_teams.collect do |attribute|
    attribute[:team_name]
  end
end

def player_numbers(team)
  numbers = []
  find_team(team)[:players].each do |player, data|
    numbers << data.fetch(:number)
  end
  numbers
end

def player_stats(player)
  all_players.fetch(player)
end

def big_shoe_rebounds
  bs = nil
  br = nil
  all_players.each do |player, stat|
    if br == nil || stat.fetch(:shoe) > bs
      bs = stat.fetch(:shoe)
      br = stat.fetch(:rebounds)
    end
  end
  br
end



def all_teams
  game_hash.values
end

def find_team(team_name)
  all_teams.find do |team|
    team[:team_name] == team_name
  end
end

def all_players
  players_hash = {}
  game_hash.each do |location, team_data|
    players_hash = players_hash.merge(team_data.fetch(:players))
  end
  players_hash
end
