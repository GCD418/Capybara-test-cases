Feature: Checkout Process
  As a logged in user
  I want to complete a purchase
  So that I can buy products

  Background:
    Given the user is logged in as standard user
    And the user has added all products to the cart
    And the user proceeds to checkout overview

  Scenario: Verify item total matches sum of product prices
    Then the item total should match the sum of all product prices

  Scenario: Verify tax amount is correct
    Then the tax amount should be correctly calculated

  Scenario: Verify total amount is correct
    Then the total amount should equal item total plus tax

  Scenario: Complete purchase successfully
    When the user clicks finish
    Then a confirmation message should be displayed
    And the confirmation should contain "Thank you for your order"
