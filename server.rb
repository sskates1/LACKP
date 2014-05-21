require_relative 'rubyMethods'
require 'sinatra'
require 'csv'
require 'uri'
require 'pry'

set :public_folder, File.dirname(__FILE__) + '/public'
set :views, File.dirname(__FILE__) + '/views'


teams_hash, teams_list, position_list = create_teams_hash('lackp_starting_rosters.csv')

before do
  @teams_list = teams_list
  @position_list = position_list
end

get '/' do
  @teams_hash = teams_hash.values
  @teams_list
  @position_list
  erb :index
# end get do
end

get '/position/:position' do
  @position = params[:position]
  @position_array = get_position_array(teams_hash, @position)
  @teams_list
  @position_list
  erb :position_page
end

get '/teams/:team_name' do
  @name = params[:team_name]
  @team_hash = teams_hash[@name]
  @teams_list
  @position_list
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
