class App < Sinatra::Base
  get '/' do
    @user = active_user
    @game = start_game
    erb :homepage
  end

  post '/' do
    @game = active_game
    @game.guess params[:guess]
    session[:game] = @game
    erb template
  end

  private

  def start_game
    session[:game] = nil

    answer = Answer.all.sample
    session[:game] = Game.new answer.clues.sample.title, answer.title
  end

  def active_game
    session[:game] ||= start_game
  end
end
