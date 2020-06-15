Feature: User can log into Musicman

Scenario: I want to log with my specs
    Given I am on the Register Page
    When I fill in "Email" with "guest@gmail.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password" 
    And I press "Sign up" 
    Then I should be on the Login Page
    When I fill in "Email" with "guest@gmail.com"
    And I fill in "Password" with "password"
    And I press "Log in"
    Then I should be on the Musicman home page
    And I follow "Logout" 
    Then I should be on the Login Page
    When I fill in "Email" with "guest@gmail.com"
    And I fill in "Password" with "password"
    And I press "Log in"
    Then I should be on the Musicman home page

Scenario: I forgot my specs
    Given I am on the Register Page
    When I fill in "Email" with "guest@gmail.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password" 
    And I press "Sign up" 
    Then I should be on the Musicman home page
    Given I am on the Login Page 
    When I follow "Forgot your password?"
    Then I should be on the forgot your password page
    And I fill in "Email" with "guest@gmail.com"
    And I press "Send me reset password instructions"
    Then I should be on the Login Page