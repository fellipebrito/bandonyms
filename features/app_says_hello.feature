Feature: app says hello

  In order to have a running webapp
  As a user
  I want an app that says hello in the web browser

  Scenario: app says hello
    Given I am on 'the homepage'
    Then I should see "Hello App!"
