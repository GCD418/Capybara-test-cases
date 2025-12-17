Feature: Inventory layout validation
  As a QA engineer
  I want every product to contain required UI elements
  So that users always see complete and valid product information

  Background:
    Given the user is logged in as "standard_user"

  Scenario: Every product card contains image, name, description, price and add-to-cart button
    When the user checks the inventory layout
    Then every product card should be complete
