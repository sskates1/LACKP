require 'csv'

#create a team hash for us to use from the CSV
def create_teams_hash(filename)
  teams_hash = {}
  teams = []
  positions = []
  CSV.foreach(filename, headers: true) do |row|
    #hash = Hash[row]

    if !(teams.include? (row["team"]))
      teams = teams.push(row["team"])
      teams_hash[row["team"]] =[]
    end

    first_name = row["first_name"]
    last_name = row["last_name"]
    position = row["position"]
    team_name_of_player = row["team"]
    player = {first_name: first_name, last_name: last_name, position: position}
    if !(positions.include?(position))
      positions.push (position)
    end

    for team_name, team_list in teams_hash
      if  team_name_of_player == team_name
        team_list.push(player)
      #end if statment
      end
    #end for loop
    end
  #end foreach loop
  end
  #return teams_hash
  return teams_hash, teams, positions
#end method
end

def get_position_array(teams_hash, position)
  position_array = []

  for team, team_array in teams_hash
    for player in team_array
      if  player[:position] == position
        player_info = {first_name: player[:first_name], last_name: player[:last_name], team: team}
        position_array.push(player_info)
      #end if position is correct
      end
    #end loop through players in a team
    end
  #end loop through different teams
  end
  return position_array
#end method
end

