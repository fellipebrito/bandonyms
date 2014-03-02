Given(/^I start a game$/) do
  @game = Game.new
end

When(/^the secret is "(.*?)"$/) do |secret|
  @game.secret = secret
end
