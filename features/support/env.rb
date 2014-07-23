require 'codeclimate-test-reporter'
require 'simplecov'

ENV['CODECLIMATE_REPO_TOKEN'] = '39a9571794292e4888b5fa33af018a3730a96bb40aa270a493d31b784d6f96b7'
CodeClimate::TestReporter.start

SimpleCov.start do
  add_filter '/features/'
  use_merging true
end

# This code make sure we generate both the HTML and the json
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  CodeClimate::TestReporter::Formatter
]

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
