@seasons
Feature: Seasons
  In order to have seasons on my website
  As an administrator
  I want to manage seasons and the content associated with them

  Background:
    Given I am a logged in refinery user
    And I have active seasons

  Scenario: List Seasons
    When I go to the list of seasons
    Then I should see "Spring"
    And I should see "Fall"

  Scenario: Select a season to manage pages for that season
    When I select "Future" from the season selector
    Then I should see the pages that belong to "future"
    And I should not see pages that belong to "current"

