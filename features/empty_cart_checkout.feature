Feature: Empty Cart Checkout
  As a logged in user
  I want to attempt checkout with an empty cart
  So that I can verify the system prevents invalid purchases

  Background:
    Given the user is logged in as standard user
    And the user is on the inventory page

  Scenario: Checkout with empty cart should not be allowed
    When the user navigates to the cart
    And the user attempts to checkout from empty cart
    Then an error should prevent the checkout process
