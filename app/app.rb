require 'sinatra/base'
require 'sinatra/reloader'

class App < Sinatra::Base
  enable :sessions

  get '/' do
    session[:game] = @game = Game.new 'King', 'Queen'
    erb :homepage
  end

  post '/' do
    @game = session[:game]
    @game.guess params[:guess]
    session[:game] = @game
    erb template
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
