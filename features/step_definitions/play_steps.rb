Given(/^I start a game with the band "(.*?)" and the secret "(.*?)"$/) do |band, secret|
  @game = Game.new secret, band
end

Given(/^I already tried (\d+) times$/) do |arg1|
  @game.tries = 4
end
