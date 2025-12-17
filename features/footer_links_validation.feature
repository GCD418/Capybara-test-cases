Feature: Footer links validation
  As a user
  I want the social media links in the footer to direct to the correct URLs
  So that I can trust the external navigation of the store

  Background:
    Given the user is logged in as "standard_user"

  Scenario: Footer links should open correct external URLs
    When the user clicks the Twitter footer link
    Then the current URL should contain "x.com"
