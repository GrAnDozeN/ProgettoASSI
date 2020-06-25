Feature: User can manage a track

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

Scenario: Can not add a track as a guest
  Given I am on the Musicman home page
  Then I should be on the Musicman home page
  When I follow "Add new track"
  Then I should be on the Login Page

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
  
Scenario: Back to track list after the show as Admin
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

Scenario: Can use Spotify preview as premium
  Given I am logged as premium
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

Scenario: Can not use Spotify preview as base user
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
  And I should not see the preview