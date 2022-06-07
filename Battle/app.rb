# ./app.rb

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/game'
require './lib/player'
require './lib/attack'

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
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb(:play)
  end

  get '/attack' do
    @game = $game
    Attack.run(@game.another_player)
    erb(:attack)
  end  

  post '/switch_turn' do
    $game.switch_turn
    redirect('/play')
  end
  
  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end
