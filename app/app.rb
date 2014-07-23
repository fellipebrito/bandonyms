require 'sinatra/base'
require 'sinatra/reloader'

class App < Sinatra::Base
  enable :sessions
  set :public_dir, 'public'

  get '/' do
    @game = create_game
    erb :homepage
  end

  post '/' do
    @game = active_game
    @game.guess params[:guess]
    session[:game] = @game
    erb template
  end

  def create_game
    session.clear

    band = Band.new
    session[:game] = Game.new band.secret, band.name
  end

  def active_game
     session[:game] ||= create_game
  end

  def template
    template   = :success if @game.right_answer?
    template   = :failed  if @game.tries >= 5
    template ||= :homepage
    template
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
