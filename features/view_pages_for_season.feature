@frontend_seasons
Feature: View pages for selected season
  In order to view the pages by season
  As a user
  I want to only be presented pages for a selected season

  Background:
    Given A Refinery user exists
    And I have a page titled "Home" with a custom url "/" and belonging to the "Spring" season
    And I have active seasons
  
  Scenario: Viewing pages for the default season
    Given the following pages exist:
      | title           | season  |
      | Spring Styles   | Spring  | 
      | Spring Home     | Spring  | 
      | Fall Styles     | Fall    | 
      | Fall Home       | Fall    | 
    When I go to the home page
    Then I should see "Spring Styles"
    And I should see "Spring Home"
    And I should not see "Fall Styles"
    And I should not see "Fall Home"
