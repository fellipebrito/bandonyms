Given(/^I start a game$/) do
  @game = Game.new
end

Given(/^I already tried (\d+) times$/) do |arg1|
  @game.tries = 4
end

When(/^the secret is "(.*?)"$/) do |secret|
  @game.secret = secret
end

When(/^the band name is "(.*?)"$/) do |secret|
  @game.secret = secret
end
