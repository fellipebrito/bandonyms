ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'app/app.rb')
require File.join(File.dirname(__FILE__), '..', '..', 'boot.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = App

class AppWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  AppWorld.new
end
