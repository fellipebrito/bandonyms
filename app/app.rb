require 'sinatra/base'
require 'sinatra/reloader'

class App < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, 'secret'
    set :public_dir, 'public'
  end

  get '/' do
    @game = start_game
    erb :homepage
  end

  post '/' do
    @game = active_game
    @game.guess params[:guess]
    session[:game] = @game
    erb template
  end

  def start_game
    session.clear

    answer = Answer.all.sample
    session[:game] = Game.new answer.clues.sample.title, answer.title
  end

  def active_game
     session[:game] ||= start_game
  end

  def template
    template   = :success if @game.right_answer?
    template   = :failed  if @game.tries >= 3
    template ||= :homepage
    template
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
