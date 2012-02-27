@seasons
Feature: Seasons
  In order to have seasons on my website
  As an administrator
  I want to manage seasons and the content associated with them

  Background:
    Given I am a logged in refinery user
    And I have chosen a default season
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
  
  @season_switch
  Scenario: Viewing list of pages for the current season
    Given the following pages exist:
      | title           | season  |
      | Spring Styles   | Spring  | 
      | Spring Home     | Spring  | 
      | Fall Styles     | Fall  | 
      | Fall Home       | Fall  | 
    When I go to the list of pages
    And "Spring" is the current season
    Then I should see "Spring Styles"
    And I should see "Spring Home"
    And I should not see "Fall Styles"
    And I should not see "Fall Home"

    
  @javascript
  Scenario: Select a season to manage pages for that season
    When I visit the admin area
    And I follow "Change Season"
    And I follow "Future"
    Then "Future" should be the current season
    And "Fall" should not be the current season
