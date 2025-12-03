Feature: GMO Order Calculation
  As a user
  I want to calculate the total price, sales tax, and grand total for an order
  So that I can verify the calculations are correct

  Background:
    Given I am on the GMO homepage
    When I click on "Enter GMO Online"

  Scenario: Verifying Order Calculations
    When I add the following items to the order:
      | Quantity | Item                   |
      | 3        | 3 Person Dome Tent     |
      | 2        | External Frame Backpack|
    And I press "Place An Order"
    Then I should see the Place Order page
    And I should see the following order details in the first table:
      | Qty | Product Description       | Unit Price | Total Price |
      | 3   | 3 Person Dome Tent        | 299.99     | 899.97      |
      | 2   | External Frame Backpack   | 179.95     | 359.90      |
    And I should see the following totals right down:
      | Product Total | 1259.87 |
      | Sales Tax     | 62.99   |
      | Grand Total   | 1327.86 |

Scenario: Verifying Order Calculations with Multiple Items
  When I add the following items to the order:
    | Quantity | Item                   |
    | 5        | Glacier Sun Glasses    |
    | 1        | Hiking Boots           |
  And I press "Place An Order"
  Then I should see the Place Order page
  And I should see the following order details in the first table:
    | Qty | Product Description       | Unit Price | Total Price |
    | 5   | Glacier Sun Glasses       | 67.99      | 339.95      |
    | 1   | Hiking Boots              | 109.90     | 109.90      |
  And I should see the following totals right down:
    | Product Total | 449.85  |
    | Sales Tax     | 22.49   |
    | Grand Total   | 477.34  |

Scenario: Verifying Order Calculations with Different Items
  When I add the following items to the order:
    | Quantity | Item                   |
    | 2        | Padded Socks           |
    | 4        | Back Country Shorts    |
  And I press "Place An Order"
  Then I should see the Place Order page
  And I should see the following order details in the first table:
    | Qty | Product Description       | Unit Price | Total Price |
    | 2   | Padded Socks              | 19.99      | 39.98       |
    | 4   | Back Country Shorts       | 24.95      | 99.80       |
  And I should see the following totals right down:
    | Product Total | 139.78  |
    | Sales Tax     | 6.99    |
    | Grand Total   | 151.77  |

Scenario: Verifying Order Calculations with Single Item
  When I add the following items to the order:
    | Quantity | Item                   |
    | 7        | 3 Person Dome Tent     |
  And I press "Place An Order"
  Then I should see the Place Order page
  And I should see the following order details in the first table:
    | Qty | Product Description       | Unit Price | Total Price |
    | 7   | 3 Person Dome Tent        | 299.99     | 2099.93     |
  And I should see the following totals right down:
    | Product Total | 2099.93  |
    | Sales Tax     | 105.00   |
    | Grand Total   | 2209.93  |

Scenario: Verifying Order Calculations with High Quantity
  When I add the following items to the order:
    | Quantity | Item                   |
    | 10       | External Frame Backpack|
    | 5        | Hiking Boots           |
  And I press "Place An Order"
  Then I should see the Place Order page
  And I should see the following order details in the first table:
    | Qty | Product Description       | Unit Price | Total Price |
    | 10  | External Frame Backpack   | 179.95     | 1799.50     |
    | 5   | Hiking Boots              | 109.90     | 549.50      |
  And I should see the following totals right down:
    | Product Total | 2349.00  |
    | Sales Tax     | 117.45   |
    | Grand Total   | 2471.45  |

Scenario: Verifying Order Calculations with Diverse Items
  When I add the following items to the order:
    | Quantity | Item                   |
    | 1        | 3 Person Dome Tent     |
    | 3        | Glacier Sun Glasses    |
    | 2        | Padded Socks           |
  And I press "Place An Order"
  Then I should see the Place Order page
  And I should see the following order details in the first table:
    | Qty | Product Description       | Unit Price | Total Price |
    | 1   | 3 Person Dome Tent        | 299.99     | 299.99      |
    | 3   | Glacier Sun Glasses       | 67.99      | 203.97      |
    | 2   | Padded Socks              | 19.99      | 39.98       |
  And I should see the following totals right down:
    | Product Total | 543.94  |
    | Sales Tax     | 27.20   |
    | Grand Total   | 576.14  |
