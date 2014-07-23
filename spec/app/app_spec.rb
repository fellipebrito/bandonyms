require 'spec_helper'

describe 'App' do
  include Rack::Test::Methods
  def app
    App.new
  end

  describe '#homepage' do
    it 'start the project' do
      get '/'
      expect(last_response.body.include?('Your guess')).to be_true
    end

    it 'guess a band' do
      post '/', params = { guess: 'Queen' }
      last_response.body.include?('Let\'s play a game!')
    end
  end
end
