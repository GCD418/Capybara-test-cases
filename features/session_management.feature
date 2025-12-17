Feature: Session Management
  As a logged in user
  I want to manage my session
  So that I can logout and maintain my cart across windows

  Background:
    Given the user is logged in as standard user
    And the user is on the inventory page

  Scenario: User can logout successfully
    When the user logs out
    Then the user should be redirected to the login page

  @maximize
  Scenario: Cart persists across multiple browser windows
    When the user adds "Sauce Labs Backpack" to the cart
    And the user opens a new window with the same session
    Then the cart should contain 1 item in the new window
