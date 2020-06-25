Feature: User can manage a review

Scenario: Add a review as a Admin
  Given I am logged as admin 
  Then I should be on the Musicman home page
  When I follow "Add new track"
  Then I should be on the Create New Track page
  When I fill in "Title" with "Stairway to heaven"
  And I fill in "Author" with "Led Zeppelin"
  And I fill in "Album" with "Led Zeppelin IV"
  And I select "Rock" from "Genre"
  And I fill in "Year" with "1971"
  And I press "Save Changes"
  Then I should be on show a track
  And I should see "Stairway to heaven"
  When I follow "Add a review"
  Then I should be on the create a review page 
  When I fill in "Comment" with "un commento"
  And I press "Add a review"
  Then I should be on show a track

Scenario: Add a review as a base user
  Given I am logged 
  Then I should be on the Musicman home page
  When I follow "Add new track"
  Then I should be on the Create New Track page
  When I fill in "Title" with "Stairway to heaven"
  And I fill in "Author" with "Led Zeppelin"
  And I fill in "Album" with "Led Zeppelin IV"
  And I select "Rock" from "Genre"
  And I fill in "Year" with "1971"
  And I press "Save Changes"
  Then I should be on show a track
  And I should see "Stairway to heaven"
  When I follow "Add a review"
  Then I should be on the create a review page 
  When I fill in "Comment" with "un commento"
  And I press "Add a review"
  Then I should be on show a track

Scenario: Edit a review as a Admin
  Given I am logged as admin 
  Then I should be on the Musicman home page
  When I follow "Add new track"
  Then I should be on the Create New Track page
  When I fill in "Title" with "Stairway to heaven"
  And I fill in "Author" with "Led Zeppelin"
  And I fill in "Album" with "Led Zeppelin IV"
  And I select "Rock" from "Genre"
  And I fill in "Year" with "1971"
  And I press "Save Changes"
  Then I should be on show a track
  And I should see "Stairway to heaven"
  When I follow "Add a review"
  Then I should be on the create a review page 
  When I fill in "Comment" with "un commento"
  And I press "Add a review"
  Then I should be on show a track
  When I follow "Edit" 
  Then I should be on the edit a review page
  When I fill in "comments" with "Edit di una review"
  And I press "Save Changes"
  Then I should be on show a track

Scenario: Delete a review as a Admin
    Given I am logged as admin 
    Then I should be on the Musicman home page
    When I follow "Add new track"
    Then I should be on the Create New Track page
    When I fill in "Title" with "Stairway to heaven"
    And I fill in "Author" with "Led Zeppelin"
    And I fill in "Album" with "Led Zeppelin IV"
    And I select "Rock" from "Genre"
    And I fill in "Year" with "1971"
    And I press "Save Changes"
    Then I should be on show a track
    And I should see "Stairway to heaven"
    When I follow "Add a review"
    Then I should be on the create a review page 
    When I fill in "Comment" with "un commento"
    And I press "Add a review"
    Then I should be on show a track
    When I follow "Remove"
    Then I should be on show a track

Scenario: Can't delete a review as a base user
  Given I am logged
  Then I should be on the Musicman home page
  When I follow "Add new track"
  Then I should be on the Create New Track page
  When I fill in "Title" with "Stairway to heaven"
  And I fill in "Author" with "Led Zeppelin"
  And I fill in "Album" with "Led Zeppelin IV"
  And I select "Rock" from "Genre"
  And I fill in "Year" with "1971"
  And I press "Save Changes"
  Then I should be on show a track
  And I should see "Stairway to heaven"
  When I follow "Add a review"
  Then I should be on the create a review page 
  When I fill in "Comment" with "un commento"
  And I press "Add a review"
  Then I should be on show a track
  Then I should not see "Delete"

Scenario: Can't edit a review as a base user
  Given I am logged
  Then I should be on the Musicman home page
  When I follow "Add new track"
  Then I should be on the Create New Track page
  When I fill in "Title" with "Stairway to heaven"
  And I fill in "Author" with "Led Zeppelin"
  And I fill in "Album" with "Led Zeppelin IV"
  And I select "Rock" from "Genre"
  And I fill in "Year" with "1971"
  And I press "Save Changes"
  Then I should be on show a track
  And I should see "Stairway to heaven"
  When I follow "Add a review"
  Then I should be on the create a review page 
  When I fill in "Comment" with "un commento"
  And I press "Add a review"
  Then I should be on show a track
  Then I should not see "Edit"