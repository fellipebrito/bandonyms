class Band
  attr_accessor :name, :secret

  def initialize
    pick = all.sample
    @name = pick['name']
    @secret = pick['secret']
  end

  def all
    YAML.load File.read('list.yaml')
  end
end
