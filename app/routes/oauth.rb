class App < Sinatra::Base
  get '/login' do
    create_session
    redirect redirect_url
  end

  get '/logout' do
    destroy_oauth
    redirect '/'
  end

  get '/callback' do
    process_callback
    redirect '/'
  end

  private
  def oauth
    Koala::Facebook::OAuth.new(490_209_437_790_343, '768ba6c42e2b877275191444755627e9', "#{request.base_url}/callback")
  end

  def destroy_oauth
    session[:oauth] = nil
    session[:access_token] = nil
  end

  def create_session
    session[:oauth] = oauth
  end

  def koala_user
    Koala::Facebook::GraphAPI.new(session['access_token']).get_object('me') if session[:access_token]
  end

  def redirect_url
    oauth.url_for_oauth_code
  end

  def process_callback
    session[:access_token] = oauth.get_access_token(params[:code]) if oauth
  end
end
