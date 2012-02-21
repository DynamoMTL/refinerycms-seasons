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
  
  @pages
  Scenario: Create a page with a season
    Given "Spring" is the current season
    When I go to the list of pages
    And I follow "Add new page"
    And I fill in "Title" with "Deigan is a wonder dog"
    And I press "Save"
    Then I should see "'Deigan is a wonder dog' was successfully added"
    And the page should belong to season "Spring"
    
  @javascript
  Scenario: Select a season to manage pages for that season
    When I follow "Change Season"
    And I follow "Future"
    Then "Future" should be the current season
    And "Fall" should not be the current season
