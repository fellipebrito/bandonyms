require 'rspec'
require 'rspec/mocks'
require 'simplecov'
require 'rack/test'
require 'factory_girl'

ENV['RACK_ENV'] = 'test'

SimpleCov.start do
  add_filter '/features/'
  use_merging true
end

if ENV['CODECLIMATE_REPO_TOKEN']
  require "codeclimate-test-reporter"

  CodeClimate::TestReporter.configure do |config|
      config.logger.level = Logger::WARN
  end
  CodeClimate::TestReporter.start

  # This code make sure we generate both the HTML and the json
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    CodeClimate::TestReporter::Formatter
  ]
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
FactoryGirl.find_definitions

require File.dirname(__FILE__) + "/../boot.rb"
require File.dirname(__FILE__) + '/../app/app.rb'
