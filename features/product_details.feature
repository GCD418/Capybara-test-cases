Feature: Product Details
  As a logged in user
  I want to view product details
  So that I can learn more about a product before purchasing

  Background:
    Given the user is logged in as standard user
    And the user is on the inventory page

  Scenario: View details of Sauce Labs Backpack
    When the user clicks on "Sauce Labs Backpack" product
    Then the product detail page should display the product name "Sauce Labs Backpack"
    And the product detail page should display a description
    And the product detail page should display a price

  Scenario: View details of Sauce Labs Bike Light
    When the user clicks on "Sauce Labs Bike Light" product
    Then the product detail page should display the product name "Sauce Labs Bike Light"
    And the product detail page should display a description
    And the product detail page should display a price
