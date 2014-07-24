require 'spec_helper'
require 'pry'

describe 'App' do
  include Rack::Test::Methods
  def app
    App.new
  end

  describe '#homepage' do
    it 'start the project' do
      get '/'
      Koala::Facebook::GraphAPI.stub(:new){ true }
      expect(last_response.body.include?('Your guess')).to be_true
    end

    it 'guess a band' do
      post '/', params = { guess: 'Queen' }
      last_response.body.include?('Let\'s play a game!')
    end
  end

  describe '@login' do
    it 'login' do
      get '/login'
      last_response.body.include?('Let\'s play a game!')
    end

    it 'logout' do
      get '/logout'
      last_response.body.include?('Let\'s play a game!')
    end

    it 'callback' do
      # oauth = double(Object)
      # oauth.stub(:get_access_token){ true }
      # expect(Koala::Facebook::OAuth).to receive(:get_access_token)

      get '/callback'
      last_response.body.include?('Let\'s play a game!')
    end
  end
end
