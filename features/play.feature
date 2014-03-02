Feature: gameplay

  In order to play the game bandonyms
  As a player
  I want to be able to post my guess

  Scenario: app says hello
    Given I am on 'the homepage'
    Then I should see "Let's play a game!"
    And I should see "guess" field

  Scenario: user guess a band's name
    Given I am on 'the homepage'
    And I start a game
    When the secret is "King"
    And I fill in "guess" with "Queen"
    And I press "Try it!"
    Then I should see "Well Done bro"
