Feature: Reset App State
  As a user
  I want the application to clear all selections when Reset App State is used
  So that I can return to a clean shopping state

  Background:
    Given the user is logged in as "standard_user"

  Scenario: Reset state clears cart and selections
    When the user adds the product "Sauce Labs Backpack" to the cart
    And the user resets the app state
    Then the cart badge should not be visible
