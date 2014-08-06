require 'spec_helper'

describe 'App' do
  include Rack::Test::Methods
  def app
    App.new
  end

  subject do
    App.new!
  end

  before(:all) { FactoryGirl.create(:answer) }
  let(:answer) { Answer.first  }

  describe '#homepage' do
    it 'start the project' do
      get '/'
      # expect(Koala::Facebook::GraphAPI).to receive(:new){ true }
      last_response.body.include?('Your guess')
    end

    it 'guess an answer' do
      post '/', params = { guess: 'Queen' }
      last_response.body.include?('Let\'s play a game!')
    end
  end

  describe '#login' do
    it 'login' do
      get '/login'
      last_response.body.include?('Let\'s play a game!')
    end

    it 'logout' do
      get '/logout'
      last_response.body.include?('Let\'s play a game!')
    end

    it 'callback' do
      # expect(App).to receive(:oauth){nil}
      get '/callback'
      last_response.body.include?('Let\'s play a game!')
    end

    it 'callback' do
      expect(subject).to receive(:oauth) { nil }
      expect(subject.send :process_callback).to eql '/'
    end
  end

  describe '#signin' do
    xit 'signin a new user' do
      expect(subject).to receive(:facebook_user) { { 'id' => 1 } }
      expect(subject.send :signin).to instance_of User
    end
    xit 'capture information about the facebook user' do
      expect(Koala::Facebook::GraphAPI).to receive(:new) { 'user' }
      expect(subject.send :facebook_user).to eql 'user'
    end
  end

  describe '#ranking' do
    it 'list the top 10 users' do
      get '/ranking'
      last_response.body.include?('Ranking')
    end
  end
end
