class App < Sinatra::Base
  get '/' do
    @user = active_user
    @game = start_game
    erb :homepage
  end

  post '/' do
    @user = active_user
    @game = active_game
    @game.guess params[:guess]
    session[:game] = @game
    erb template
  end

  private

  def start_game
    session[:game] = nil

    answer = Answer.all.sample
    session[:game] = Game.new @user, answer
  end

  def active_game
    session[:game] ||= start_game
  end
end
