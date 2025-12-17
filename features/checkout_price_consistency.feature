Feature: Checkout price consistency
  As a customer
  I want the item total shown at checkout to match the sum of product prices
  So that I can trust the price calculation

  Background:
    Given the user is logged in as "standard_user"

  Scenario: Item total matches sum of selected products
    When the user adds the product "Sauce Labs Backpack" to the cart
    And the user adds the product "Sauce Labs Bike Light" to the cart
    And the user goes to checkout overview
    Then the item total should equal the sum of the product prices
