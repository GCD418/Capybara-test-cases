Feature: Shopping Cart Management
  As a logged in user
  I want to manage items in my shopping cart
  So that I can prepare for checkout

  Background:
    Given the user is logged in as standard user
    And the user is on the inventory page

  Scenario: Add all products to cart
    When the user adds all products to the cart
    Then all products should be in the cart

  Scenario: Remove all products from cart
    Given the user has added all products to the cart
    When the user removes all products from the cart
    Then the cart should be empty
