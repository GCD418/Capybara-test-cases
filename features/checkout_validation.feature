Feature: Checkout Validation
  As a logged in user
  I want to complete the checkout process
  So that I can purchase products

  Background:
    Given the user is logged in as standard user
    And the user has added all products to the cart
    And the user is on the checkout information page

  Scenario: Checkout fails without first name
    When the user fills checkout form with last name "Smith" and postal code "12345"
    And the user clicks continue on checkout
    Then an error message should be displayed on checkout
    And the checkout error should contain "First Name is required"

  Scenario: Checkout fails without last name
    When the user fills checkout form with first name "John" and postal code "12345"
    And the user clicks continue on checkout
    Then an error message should be displayed on checkout
    And the checkout error should contain "Last Name is required"

  Scenario: Checkout fails without postal code
    When the user fills checkout form with first name "John" and last name "Smith"
    And the user clicks continue on checkout
    Then an error message should be displayed on checkout
    And the checkout error should contain "Postal Code is required"
