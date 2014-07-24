require "codeclimate-test-reporter"
require 'rspec'
require 'rspec/mocks'
require 'simplecov'
require 'rack/test'

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

require File.dirname(__FILE__) + "/../boot.rb"
require File.dirname(__FILE__) + '/../app/app.rb'
