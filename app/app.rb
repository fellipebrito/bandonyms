require 'sinatra/base'
require 'sinatra/reloader'

class App < Sinatra::Base
  enable :sessions

  get '/' do
    @message = 'Let\'s play a game!'

    @game = Game.new
    @game.secret = 'King'
    session[:tries] = @game.tries

    erb :homepage
  end

  post '/' do
    template = :homepage

    @game = Game.new
    @game.secret = 'King'
    @game.band   = 'Queen'

    if @game.band == params[:guess]
      @message = 'Well Done bro'

      template = :success
    else
      @game.tries = session[:tries] + 1
      session[:tries] = @game.tries

      if @game.tries <= 1
        @message = "You already tried #{@game.tries} time. Try again!"
      elsif @game.tries > 1 && @game.tries < 5
        @message = "You already tried #{@game.tries} times. Try again!"
      else
        @message = "You already tried #{@game.tries} times. Game over. Go home, you are drunk"

        template = :failed
      end
    end

    erb template
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
