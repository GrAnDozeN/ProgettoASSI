Feature:Una cosa a caso

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

