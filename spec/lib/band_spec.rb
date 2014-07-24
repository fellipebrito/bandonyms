require 'spec_helper'

describe Band do
  it 'initializes correct' do
    YAML.stub(:load){ ['name' => 'Queen', 'secret' => 'King'] }

    band = Band.new
    expect(band.name).to eql 'Queen'
    expect(band.secret).to eql 'King'
  end
end
