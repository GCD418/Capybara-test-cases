Feature: Navigation
  As a logged in user
  I want to navigate between pages
  So that I can browse and manage my shopping experience

  Background:
    Given the user is logged in as standard user
    And the user is on the inventory page

  Scenario: Navigate back to inventory from cart
    When the user navigates to the cart
    And the user clicks continue shopping
    Then the user should be on the inventory page
