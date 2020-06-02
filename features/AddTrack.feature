Feature: User can add manually a track

Scenario: Add a track as a base user
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

Scenario: Add a track as Admin
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

Scenario: Edit a track as a admin
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
  Given I am on the Musicman home page
  Then I should be on the Musicman home page
  When I follow "Details"
  Then I should be on show a track
  When I follow "Edit info"
  Then I should be on the edit a track page
  When I fill in "Title" with "modificato"
  And I fill in "Author" with "modificato"
  And I fill in "Album" with "modificato" 
  And I press "Save Changes"
  Then I should be on show a track

Scenario: When i click on Sign up/Log In i will be redirected
  Given I am on the Login Page
  When I follow "Sign up" 
  Then I should be on the Register Page
  When I follow "Log in" 
  Then I should be on the Login Page


Scenario: /////When i click Logout i will be logged out//// VA RIVISTO
  Given I am logged 
  Given I am on the Musicman home page
  When I follow "Logout"

Scenario: Delete a track as a Admin
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
  Given I am on the Musicman home page
  When I follow "Details"
  Then I should be on show a track
  When I follow "Delete"
  Then I should be on the Musicman home page

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

Scenario: Back to track list after the show
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
  Given I am on the Musicman home page
  Then I should be on the Musicman home page
  When I follow "Details"
  Then I should be on show a track
  When I follow "Back to track list"
  Then I should be on the Musicman home page
  
Scenario: Back to track list after the show
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
  Given I am on the Musicman home page
  Then I should be on the Musicman home page
  When I follow "Details"
  Then I should be on show a track
  When I follow "Back to track list"
  Then I should be on the Musicman home page

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
  Then I should not see "Remove"

Scenario: Can't delete a track as a base user
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
  And I should not see "Delete"

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

Scenario: Can't edit an added track as a base user
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
  Given I am on the Musicman home page
  Then I should be on the Musicman home page
  When I follow "Details"
  Then I should be on show a track
  And I should not see "Edit info"

Scenario: Can use Spotify preview as admin
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
  And I should see the preview

Scenario: Can use Spotify preview as admin
  Given I am logged as admin
  Then I should be on the Musicman home page
  When I follow "Add new track"
  Then I should be on the Create New Track page
  When I fill in "Title" with "Unknwon"
  And I fill in "Author" with "Unknown"
  And I fill in "Album" with "Unknown"
  And I select "Rock" from "Genre"
  And I fill in "Year" with "1971"
  And I press "Save Changes"
  Then I should be on show a track
  And I should not see the preview

