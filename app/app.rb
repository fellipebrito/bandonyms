require 'sinatra/base'
require 'sinatra/reloader'

class App < Sinatra::Base
  get '/' do
    @message = 'Let\'s play a game!'

    erb :homepage
  end

  post '/' do
    @message = 'Well Done bro'

    erb :homepage
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
