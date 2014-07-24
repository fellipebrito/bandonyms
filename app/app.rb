require 'sinatra/base'
require 'sinatra/reloader'
require "sinatra/activerecord"

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    enable :sessions
    set :session_secret, 'secret'
    set :public_dir, 'public'
    set :database, {adapter: "sqlite3", database: "db/dev.sqlite3"}
    # or set :database_file, "path/to/database.yml"
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

    band = Band.new
    session[:game] = Game.new band.secret, band.name
  end

  def active_game
     session[:game] ||= start_game
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
