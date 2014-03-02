require 'sinatra/base'
require 'sinatra/reloader'

class App < Sinatra::Base
  get '/' do
    @message = 'Let\'s play a game!'

    @game = Game.new
    @game.secret = 'King'

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
      @game.tries = @game.tries + 1
      if @game.tries <= 1
        @message = "You already tried #{@game.tries} time. Try again!"
      else
        @message = "You already tried #{@game.tries} times. Try again!"
      end
    end

    erb template
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
