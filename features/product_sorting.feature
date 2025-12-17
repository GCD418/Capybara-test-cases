Feature: Product Sorting
  As a logged in user
  I want to sort products by different criteria
  So that I can find products more easily

  Background:
    Given the user is logged in as standard user
    And the user is on the inventory page

  Scenario: Sort products by name A to Z
    When the user sorts products by "Name (A to Z)"
    Then the products should be sorted alphabetically ascending

  Scenario: Sort products by name Z to A
    When the user sorts products by "Name (Z to A)"
    Then the products should be sorted alphabetically descending

  Scenario: Sort products by price low to high
    When the user sorts products by "Price (low to high)"
    Then the products should be sorted by price ascending

  Scenario: Sort products by price high to low
    When the user sorts products by "Price (high to low)"
    Then the products should be sorted by price descending
