Feature: gameplay

  In order to play the game bandonyms
  As a player
  I want to be able to post my guess

  Scenario: app says hello
    Given I am on 'the homepage'
    Then I should see "Let's play a game!"
    And I should see "guess" field

  Scenario: user guess the correct band's name
    Given I am on 'the homepage'
    And I start a game
    When the secret is "King"
    And I fill in "guess" with "Queen"
    And I press "Try it!"
    Then I should see "Well Done bro"

  Scenario: user guess the wrong band's name
    Given I am on 'the homepage'
    And I start a game
    When the secret is "King"
    And I fill in "guess" with "Pawn"
    And I press "Try it!"
    Then I should see "Try again!"
    And I should see "You already tried 1 time"

  Scenario: user guess the wrong band's name more than 5 times
    Given I am on 'the homepage'
    And I start a game
    And I already tried 4 times
    When the secret is "King"
    And I fill in "guess" with "Pawn"
    And I press "Try it!"
    Then I should see "Go home, you're drunk"
    And I should see "You already tried 5 times"
    And I should see "Restart the game with another band"
    And I should not see "guess" field
