Feature: User can visit pages for user managment

Scenario: When i click on Sign up i will be redirected
  Given I am on the Login Page
  When I follow "Sign up" 
  Then I should be on the Register Page

Scenario: When i click on Log In i will be redirected
  Given I am on the Musicman home page
  When I follow "Login" 
  Then I should be on the Login Page

Scenario: When i click Logout i will be logged out
  Given I am logged 
  Given I am on the Musicman home page
  When I follow "Logout"
  Then I should be on the Musicman home page
  And I should see "Login"