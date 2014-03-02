require 'sinatra/base'
require 'sinatra/reloader'

class App < Sinatra::Base
  get '/' do
    erb :homepage
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
