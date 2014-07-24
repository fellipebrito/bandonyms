require 'sinatra/base'
require 'sinatra/reloader'
require 'koala'

class App < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, 'secret'
    set :public_dir, 'public'
  end

  get '/' do
    @user = Koala::Facebook::GraphAPI.new(session["access_token"]).get_object("me") if session[:access_token]
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
    session[:game] = nil

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


  # Facebook
  get '/login' do
    session[:oauth] = Koala::Facebook::OAuth.new(490209437790343, '768ba6c42e2b877275191444755627e9', "#{request.base_url}/callback")
    redirect session[:oauth].url_for_oauth_code()
  end

  get '/callback' do
    redirect '/' unless session[:oauth]

    session[:access_token] = session[:oauth].get_access_token(params[:code])
    session[:access_token]

    redirect '/'
  end

  get '/logout' do
    session[:oauth] = nil
    session[:access_token] = nil
    redirect '/'
  end
end
