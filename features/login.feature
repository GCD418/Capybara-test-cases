Feature: User Login
  As a user of Sauce Demo
  I want to log in to the application
  So that I can access the product catalog

  Scenario: Successful login with standard user
    Given the user is on the login page
    When the user logs in with username "standard_user" and password "secret_sauce"
    Then the user should be redirected to the inventory page

  Scenario: Login fails with incorrect password
    Given the user is on the login page
    When the user logs in with username "standard_user" and password "wrong_password"
    Then an error message should be displayed
    And the error message should contain "Username and password do not match"

  Scenario: Login fails with incorrect username
    Given the user is on the login page
    When the user logs in with username "invalid_user" and password "secret_sauce"
    Then an error message should be displayed
    And the error message should contain "Username and password do not match"

  Scenario: Login fails with empty credentials
    Given the user is on the login page
    When the user attempts to login without entering credentials
    Then an error message should be displayed
    And the error message should contain "Username is required"

  Scenario: Locked out user cannot login
    Given the user is on the login page
    When the user logs in with username "locked_out_user" and password "secret_sauce"
    Then an error message should be displayed
    And the error message should contain "this user has been locked out"
