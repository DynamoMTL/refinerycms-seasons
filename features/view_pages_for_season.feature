@frontend_seasons
Feature: View pages for selected season
  In order to view the pages by season
  As a user
  I want to only be presented pages for a selected season

  Background:
    Given I am a logged in refinery user
    And I have a page titled "Home" with a custom url "/" and belonging to the "Spring" season
    And I have active seasons
    And the following pages exist:
      | title           | season  |
      | Spring Styles   | Spring  | 
      | Spring Home     | Spring  | 
      | Fall Styles     | Fall    | 
      | Fall Home       | Fall    | 
  
  Scenario: Viewing pages for the default season
    When I have chosen "Spring" as my season
    Then I should see "Spring Styles"
    And I should see "Spring Home"
    And I should not see "Fall Styles"
    And I should not see "Fall Home"
