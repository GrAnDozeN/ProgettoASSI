Feature: User can add manually a track

Scenario: Add a track
  Given I am on the Musicman home page
  When I follow "Add new track"
  Then I should be on the Create New Track page
  When I fill in "Title" with "Stairway to haeven"
  And I fill in "Author" with "Led Zeppelin"
  And I fill in "Album" with "Led Zeppelin IV"
  And I select "Rock" from "Genre"
  And I press "Save Changes"
  Then I should be on the Musicman home page
  And I should see "Stairway to haeven"
