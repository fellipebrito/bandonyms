Feature: login

  In order to play the game as a registered user
  As a player
  I want to be able to login with facebook

  Scenario: login with facebook
    Given I am not logged in
    When I click to login with facebook
    Then I should be signed in
    And I should see "right answers"

  Scenario: logout
    Given I am logged in
    When I click to logout
    Then I should be logged off
