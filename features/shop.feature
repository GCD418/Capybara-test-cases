Feature: GMO OnLine Automation
  As a user of the Borland demo site
  I want to place purchase orders
  To validate that the system works correctly

  Background:
    Given I am on the GMO OnLine home page

  # Basic Navigation
  Scenario: Enter the product catalog
    When I click the "Enter GMO OnLine" button
    Then I should see the title "OnLine Catalog"
    And I should see the list of available products

  #Empty Order Validation (Alert Handling)
  Scenario: Attempt to place an order without products
    Given I navigate to the product catalog
    When I select no products and click "Place An Order"
    Then I should see an alert with the message "Please Order Something First"

  # Business Logic (Price Calculation)
  Scenario: Calculate total for a specific product
    Given I navigate to the product catalog
    When I enter quantity "4" for the product "3 Person Dome Tent"
    And I click "Place An Order"
    #Agregar el tax y el shipping
    Then I should be on the "Place Order" page
    And the line total should be "$ 1199.96"
    # Note: Unit price is 299.99 * 4

  # Reset Functionality
  Scenario: Reset the order form
    Given I navigate to the product catalog
    When I enter quantity "10" for the product "External Frame Backpack"
    And I click the "Reset Form" button
    Then the quantity field for "External Frame Backpack" should be empty

  # Full Flow (End to End)
  Scenario: Perform a successful complete purchase
    Given I navigate to the product catalog
    When I enter quantity "1" for the product "Glacier Sun Glasses"
    And I click "Place An Order"
    And I click "Proceed With Order"
    And I fill the billing form with the following data:
      | field       | value           |
      | Name        | John Doe        |
      | Address     | 123 Fake Street |
      | City        | New York        |
      | State       | NY              |
      | Zip         | 10001           |
      | Phone       | 555-1234        |
      | Email      | fakemail@gmail.com|
      | Card Number | 123456789012345 |
      | Exp Date    | 12/25           |
    And I click "Process Order"
    Then I should see the receipt with the title "OnLine Store Receipt"
