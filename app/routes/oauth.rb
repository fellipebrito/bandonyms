class App < Sinatra::Base
  get '/login' do
    create_session
    redirect redirect_url
  end

  get '/logout' do
    redirect logout
  end

  get '/callback' do
    redirect process_callback
  end

  private

  def create_session
    session[:oauth] = oauth
  end

  def redirect_url
    oauth.url_for_oauth_code
  end

  def oauth
    Koala::Facebook::OAuth.new(settings.facebook_app_id, settings.facebook_secret, "#{request.base_url}/callback")
  end

  def logout
    destroy_oauth
    '/'
  end

  def destroy_oauth
    session[:oauth] = nil
    session[:access_token] = nil
  end

  def active_user
    signin if session[:access_token]
  end

  def signin
    user = User.find_by(facebook_id: facebook_user['id'])

    signup facebook_user unless user

    user
  end

  def facebook_user
    Koala::Facebook::GraphAPI.new(session[:access_token]).get_object('me')
  end

  def signup facebook_user
    user = User.new unless user
    user.signup facebook_user
  end

  def process_callback
    '/'
    session[:access_token] = oauth.get_access_token(params[:code]) if oauth
  end
end
