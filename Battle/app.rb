require 'sinatra/base'
require 'sinatra/reloader'

class Battle < Sinatra::Base


  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  # our routes would go here
  get '/' do
    erb(:index)
  end

  post '/names' do
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    @player_1 = $player_1
    @player_2 = $player_2
    redirect '/play'
  end

  get '/play' do
    @player_1 = $player_1
    @player_2 = $player_2
    erb(:play)
  end

  get '/attack' do
    @player_1 = $player_1
    @player_2 = $player_2
    $player_1.attack($player_2)
    erb(:attack)
  end  
  
  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end