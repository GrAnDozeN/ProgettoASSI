Feature: User can visit About page

Scenario: I can visit the About page
  Given I am logged
  Then I should be on the Musicman home page
  When I follow "About us"
  Then I should be on the about page

Scenario: I can email a developer
  Given I am logged
  Then I should be on the Musicman home page
  When I follow "About us"
  Then I should be on the about page
  When I press the first "Contact Developer"
  Then I should be on the Contact page
  When I fill in "send_msg" with "Something to send"
  And I press "Send Message"
  Then I should be on the about page