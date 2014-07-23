require 'cucumber/rspec/doubles'

Given(/^I start a game with the band "(.*?)" and the secret "(.*?)"$/) do |band, secret|
  @game = Game.new secret, band
  App.any_instance.stub(:create_game).and_return(@game)
  visit path_to("homepage")
end

Given(/^I already tried (\d+) times$/) do |arg1|
  @game.tries = 4
end
