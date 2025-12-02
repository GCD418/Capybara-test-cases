Feature: GMO OnLine Automation
  As a user of the Borland demo site
  I want to place purchase orders
  To validate that the system works correctly

  Background:
    Given I am on the GMO OnLine home page

  # Caso 4 (Tú)
  Scenario: Reset the order form
    Given I navigate to the product catalog
    When I enter quantity "10" for the product "External Frame Backpack"
    And I click the "Reset Form" button
    Then the quantity field for "External Frame Backpack" should be empty

  # Caso 5 (Tú)
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
      | Card Number | 123456789012345 |
      | Exp Date    | 12/25           |
    And I click "Process Order"
    Then I should see the receipt with the title "OnLine Store Receipt"
