Feature: gameplay

  In order to play the game bandonyms
  As a player
  I want to be able to post my guess

  Scenario: game is ready to play
    Given I start a game with the band "Queen" and the secret "King"
    Then I should see "Let's play a game!"
    And I should see "your band's antonym is King"
    And I should see "guess" field

  Scenario: user skips and reload
    Given I start a game with the band "Queen" and the secret "King"
    When I follow "Skip..."
    Then I should see "Let's play a game!"

  Scenario: user guess the correct band's name
    Given I start a game with the band "Queen" and the secret "King"
    Given I am on the homepage
    When I fill in "guess" with "Queen"
    And I press "Try it!"
    Then I should see "Well Done bro"

  Scenario: user guess the correct band's name not cap sensitive
    Given I start a game with the band "Queen" and the secret "King"
    When I fill in "guess" with "qUEeN"
    And I press "Try it!"
    Then I should see "Well Done bro"

  Scenario: user guess the wrong band's name
    Given I start a game with the band "Queen" and the secret "King"
    When I fill in "guess" with "Pawn"
    And I press "Try it!"
    Then I should see "Try again!"
    And I should see "You already tried 1 time"

  Scenario: user guess the wrong band's name more than 3 times
    Given I start a game with the band "Queen" and the secret "King"
    When I already tried 3 times
    And I fill in "guess" with "Pawn"
    And I press "Try it!"
    Then I should see "Game over. Go home, you are drunk"
    And I should see "Retry with another band"
    And I should not see "guess" field
