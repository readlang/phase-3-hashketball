# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end


def num_points_scored name
  query = game_hash[:home][:players].find{|x| x[:player_name] == name }

  if query != nil #if name is included in home
    return query[:points]
  end

  query = game_hash[:away][:players].find{|x| x[:player_name] == name }

  if query != nil #if name is included in away
    return query[:points]
  end

  return "name not included in teams"
end


def shoe_size name
  query = game_hash[:home][:players].find{|x| x[:player_name] == name }

  if query != nil #if name is included in home
    return query[:shoe]
  end

  query = game_hash[:away][:players].find{|x| x[:player_name] == name }

  if query != nil #if name is included in away
    return query[:shoe]
  end

  return "name not included in teams"
end


def team_colors team_name_entry
  # game_hash.select{ |key, value| value[:team_name] == team_name_entry } [:home][:colors]
  array = []
  game_hash.each do |key, value|  
    if value[:team_name] == team_name_entry
      array = value[:colors]
    end

  end
  array
end


def team_names 
  array = []
  game_hash.each do |k, v|
    array.push( v[:team_name] )
  end
  array
end

#p team_names

def player_numbers team_name
  array = []
  game_hash.each do |k, v|
    if v[:team_name] == team_name
      v[:players].each {|i| array.push(i[:number]) }
    end
  end
  array
end

#p player_numbers "Brooklyn Nets"

def player_stats name
  game_hash.each do |k, v|
    v[:players].each do |x|
      if x[:player_name] == name
        return x
      end
    end
  end

end

# pp player_stats "Alan Anderson"

def big_shoe_rebounds 
  largest_shoe_player = ""
  largest_shoe_player_rebounds = 0
  largest_shoe_size = 0

  game_hash.each do |k, v|
    v[:players].each do |i|
      if i[:shoe] > largest_shoe_size
        largest_shoe_player = i[:player_name]
        largest_shoe_player_rebounds = i[:rebounds]
        largest_shoe_size = i[:shoe]
      end
    end
  end
  puts largest_shoe_player
  largest_shoe_player_rebounds
end


p big_shoe_rebounds