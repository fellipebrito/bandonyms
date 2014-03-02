require 'yaml'

@config = YAML.load File.open './config/settings.yml'

Dir['./lib/*.rb'].each { |file| require file }
