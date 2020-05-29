Feature: User can register

Scenario: User register to Musicman
    Given I am on the Register Page
    When I fill in "Email" with "guest@gmail.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password" 
    And I press "Sign up" 
    Then I should be on the Musicman home page