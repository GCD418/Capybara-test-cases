Feature: Menu options validation
  As a user
  I want to see all required menu options
  So that I can navigate through the application correctly

  Background:
    Given the user is logged in as "standard_user"

  Scenario: All menu options should be visible
    When the user opens the menu
    Then the menu should contain all required options
