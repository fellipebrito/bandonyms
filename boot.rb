require 'yaml'
require 'active_record'

environment = ENV['RACK_ENV'] || 'development'

@config = YAML.load File.open './config/settings.yml'

# ActiveRecord
dbconfig = YAML.load(File.read('config/database.yml'))
#p dbconfig[environment]
ActiveRecord::Base.establish_connection dbconfig[environment]

# Load Libs
Dir['./lib/*.rb'].each { |file| require file }
Dir['./lib/models/*.rb'].each { |file| require file }
