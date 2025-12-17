Feature: Product description validation
  As a shopper
  I want every product to show a meaningful description
  So that I can understand what each product is

  Background:
    Given the user is logged in as "standard_user"

  Scenario: All products must have non-empty descriptions
    When the user reviews the product descriptions
    Then no product should have an empty description
