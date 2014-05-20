require 'sinatra'
require 'csv'
require 'uri'
require 'pry'

set :public_folder, File.dirname(__FILE__) + '/public'
set :views, File.dirname(__FILE__) + '/views'

team_hash = {}

  teams = []

  CSV.foreach('lackp_starting_rosters.csv', headers: true) do |row|
    #hash = Hash[row]

    if !(teams.include? (row["team"]))
      teams = teams.push(row["team"])
      team_hash[row["team"]] =[]
    end

    first_name = row["first_name"]
    last_name = row["last_name"]
    position = row["position"]
    position_of_player = row["team"]
    player = {first_name: first_name, last_name: last_name, position: position}


    for team_name, team_list in team_hash
      if position_of_player == team_name
        team_list.push(player)
      #end if statment
      end
    #end for loop
    end
  #end foreach loop
  end

get '/' do
  @team_hash = team_hash.values
  erb :index
# end get do
end

get '/teams/:team_name' do
  @name = params[:team_name]
  @team_hash = team_hash[@name]
  erb :team_page
end


# get '/' do
#   '''
#   <!DOCTYPE html>
#   <html lang="en">
#     <head>
#     <title>Basic HTML Page</title>
#     <link rel="stylesheet" href="home.css">
#   </head>

#     <body>
#       <h1>TODO list</h1>

#       <ul>
#         <li>pay bills</li>
#         <li>buy milk</li>
#         <li>learn Ruby</li>
#       </ul>
#     </body>
#   </html>
#   '''
# end
