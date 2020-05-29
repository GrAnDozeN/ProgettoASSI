Feature: User can add manually a track

Scenario: User Add a track
  Given I am logged
  Given I am on the Musicman home page
  When I follow "Add new track"
  Then I should be on the Create New Track page
  When I fill in "Title" with "Stairway to haeven"
  And I fill in "Author" with "Led Zeppelin"
  And I fill in "Album" with "Led Zeppelin IV"
  And I select "Rock" from "Genre"
  And I fill in "Year" with "1971"
  And I press "Save Changes"
  Then I should be on show a track
  And I should see "Stairway to haeven"

Scenario: Edit a track
  Given I am on the Register Page
  When I fill in "Email" with "guest@gmail.com"
  And I fill in "Password" with "password"
  And I fill in "Password confirmation" with "password" 
  And I press "Sign up" 
  Then I should be on the Musicman home page 
  When I follow "Add new track"
  Then I should be on the Create New Track page
  When I fill in "Title" with "Stairway to haeven"
  And I fill in "Author" with "Led Zeppelin"
  And I fill in "Album" with "Led Zeppelin IV"
  And I select "Rock" from "Genre"
  And I fill in "Year" with "1971"
  And I press "Save Changes"
  Then I should be on show a track
  And I should see "Stairway to haeven"
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
