require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/config_file'

class App < Sinatra::Base
  register Sinatra::ConfigFile
  config_file '../config/settings.yml'

  configure do
    enable :sessions
    set :session_secret, 'paralelepipedo'
    set :public_dir, 'public'
  end

  require_relative 'routes/init'

  private

  def template
    template   = :success if @game.right_answer? active_user
    template   = :failed  if @game.tries >= 3
    template ||= :homepage
    template
  end
end
