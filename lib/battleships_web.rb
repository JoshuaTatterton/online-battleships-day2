require 'sinatra/base'
require 'sinatra/session'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views')}
  enable :sessions
  get '/' do
    erb :index
  end
  get '/newgame' do
    @name = params[:name]
    session[:game] = Game.new Player, Board
  	erb :newgame
  end

  get '/vscomputer' do
    @location = params[:location]
    erb :vscomputer
  end
	
  # start the server if ruby file executed directly
  run! if app_file == $0
end
