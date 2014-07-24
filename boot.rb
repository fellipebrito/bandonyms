require 'yaml'

@config = YAML.load File.open './config/settings.yml'

Dir['./lib/*.rb'].each { |file| require file }
Dir['./lib/models/*.rb'].each { |file| require file }
