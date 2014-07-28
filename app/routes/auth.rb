class App < Sinatra::Base
  get '/login' do
    redirect oauth_redirect_url
  end

  get '/logout' do
    redirect logout
  end

  get '/callback' do
    redirect '/' unless session[:oauth]

    session[:access_token] = session[:oauth].get_access_token(params[:code])
    session[:access_token]

    redirect '/'
  end

  private

  def koala_user
    Koala::Facebook::GraphAPI.new(session['access_token']).get_object('me') if session[:access_token]
  end

  def oauth_redirect_url
    session[:oauth] = Koala::Facebook::OAuth.new(490_209_437_790_343, '768ba6c42e2b877275191444755627e9', "#{request.base_url}/callback")
    session[:oauth].url_for_oauth_code
  end

  def logout
    session[:oauth] = nil
    session[:access_token] = nil
    '/'
  end
end
