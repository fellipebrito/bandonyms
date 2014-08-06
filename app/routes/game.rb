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

  get '/ranking' do
    raw_sql = 'SELECT *,
                (SELECT count(id) FROM matches
                  WHERE matches.user_id = users.id
                ) as matches
               FROM users
               WHERE matches > 0
               ORDER BY matches DESC
               LIMIT 0,10'

    @users = ActiveRecord::Base.connection.execute(raw_sql)

    erb :ranking
  end

  private

  def start_game
    session[:game] = nil

    answer = Answer.all.sample
    session[:game] = Game.new answer.title, answer.clues.first.title
  end

  def active_game
    session[:game] ||= start_game
  end
end
