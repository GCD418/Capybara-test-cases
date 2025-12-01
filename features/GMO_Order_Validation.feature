 Feature: GMO Online Catalog Item Details
 As a user
  I want to place a big order with multiple items
  So that I can verify the total price and details of my order

  Background:
    Given I am on the GMO homepage
    When I click on "Enter GMO OnLine"


  @maximize
  Scenario: Placing an Order with Multiple Items(6 Products × Qty 5)
    When I add the following items to the order:
      | Quantity | Item                   |
      | 5        | 3 Person Dome Tent     |
      | 5        | External Frame Backpack|
      | 5        | Glacier Sun Glasses    |
      | 5        | Padded Socks           |
      | 5        | Hiking Boots           |
      | 5        | Back Country Shorts    |
    And I press "Place An Order"
    Then I should see the Place Order page
    And I should see the following order details:
      | Qty | Product Description       | Delivery Status | Unit Price | Total Price |
      | 5   | 3 Person Dome Tent        | To Be Shipped   | $ 299.99   | $ 1499.95   |
      | 5   | External Frame Backpack   | To Be Shipped   | $ 179.95   | $ 899.75    |
      | 5   | Glacier Sun Glasses       | To Be Shipped   | $ 67.99    | $ 339.95    |
      | 5   | Padded Socks              | To Be Shipped   | $ 19.99    | $ 99.95     |
      | 5   | Hiking Boots              | To Be Shipped   | $ 109.90   | $ 549.50    |
      | 5   | Back Country Shorts       | To Be Shipped   | $ 24.95    | $ 124.75    |
    And I should see the information bellow totally completed:
      | Product Total             | $ 3513.85   |
      | Sales Tax                 | $ 175.69    |
      | Shipping & Handling       | $ 5.00      |
      | Grand Total               | $ 3694.54   |

@maximize
Scenario: Placing an Order with Different Quantities (2, 6, 8, 3, 10, 12)
  When I add the following items to the order:
    | Quantity | Item                   |
    | 2        | 3 Person Dome Tent     |
    | 6        | External Frame Backpack|
    | 8        | Glacier Sun Glasses    |
    | 3        | Padded Socks           |
    | 10       | Hiking Boots           |
    | 12       | Back Country Shorts    |
  And I press "Place An Order"
  Then I should see the Place Order page
  And I should see the following order details:
    | Qty | Product Description       | Delivery Status | Unit Price | Total Price |
    | 2   | 3 Person Dome Tent        | To Be Shipped   | $ 299.99   | $ 599.98    |
    | 6   | External Frame Backpack   | To Be Shipped   | $ 179.95   | $ 1079.70   |
    | 8   | Glacier Sun Glasses       | To Be Shipped   | $ 67.99    | $ 543.92    |
    | 3   | Padded Socks              | To Be Shipped   | $ 19.99    | $ 59.97     |
    | 10  | Hiking Boots              | To Be Shipped   | $ 109.90   | $ 1099.00   |
    | 12  | Back Country Shorts       | To Be Shipped   | $ 24.95    | $ 299.40    |
  And I should see the information bellow totally completed:
    | Product Total             | $ 3681.97   |
    | Sales Tax                 | $ 184.10    |
    | Shipping & Handling       | $ 5.00      |
    | Grand Total               | $ 3871.07   |


@maximize
Scenario: Placing an Order with Different Quantities (5, 1, 7, 15, 9, 3)
  When I add the following items to the order:
    | Quantity | Item                   |
    | 5        | 3 Person Dome Tent     |
    | 1        | External Frame Backpack|
    | 7        | Glacier Sun Glasses    |
    | 15       | Padded Socks           |
    | 9        | Hiking Boots           |
    | 3        | Back Country Shorts    |
  And I press "Place An Order"
  Then I should see the Place Order page
  And I should see the following order details:
    | Qty | Product Description       | Delivery Status | Unit Price | Total Price |
    | 5   | 3 Person Dome Tent        | To Be Shipped   | $ 299.99   | $ 1499.95   |
    | 1   | External Frame Backpack   | To Be Shipped   | $ 179.95   | $ 179.95    |
    | 7   | Glacier Sun Glasses       | To Be Shipped   | $ 67.99    | $ 475.93    |
    | 15  | Padded Socks              | To Be Shipped   | $ 19.99    | $ 299.85    |
    | 9   | Hiking Boots              | To Be Shipped   | $ 109.90   | $ 989.10    |
    | 3   | Back Country Shorts       | To Be Shipped   | $ 24.95    | $ 74.85     |
  And I should see the information bellow totally completed:
    | Product Total             | $ 3519.63   |
    | Sales Tax                 | $ 175.98    |
    | Shipping & Handling       | $ 5.00      |
    | Grand Total               | $ 3700.61   |


@maximize
Scenario: Placing an Order with Different Quantities (2, 11, 3, 8, 5, 10)
  When I add the following items to the order:
    | Quantity | Item                    |
    | 2        | 3 Person Dome Tent      |
    | 11       | External Frame Backpack |
    | 3        | Glacier Sun Glasses     |
    | 8        | Padded Socks            |
    | 5        | Hiking Boots            |
    | 10       | Back Country Shorts     |
  And I press "Place An Order"
  Then I should see the Place Order page
  And I should see the following order details:
    | Qty | Product Description       | Delivery Status | Unit Price | Total Price |
    | 2   | 3 Person Dome Tent        | To Be Shipped   | $ 299.99   | $ 599.98    |
    | 11  | External Frame Backpack   | To Be Shipped   | $ 179.95   | $ 1979.45   |
    | 3   | Glacier Sun Glasses       | To Be Shipped   | $ 67.99    | $ 203.97    |
    | 8   | Padded Socks              | To Be Shipped   | $ 19.99    | $ 159.92    |
    | 5   | Hiking Boots              | To Be Shipped   | $ 109.90   | $ 549.50    |
    | 10  | Back Country Shorts       | To Be Shipped   | $ 24.95    | $ 249.50    |
  And I should see the information bellow totally completed:
    | Product Total             | $ 3742.32   |
    | Sales Tax                 | $ 187.12    |
    | Shipping & Handling       | $ 5.00      |
    | Grand Total               | $ 3934.44   |

@maximize
Scenario: Placing an Order with Different Quantities (15, 2, 9, 4, 3, 7)
  When I add the following items to the order:
    | Quantity | Item                    |
    | 15       | 3 Person Dome Tent      |
    | 2        | External Frame Backpack |
    | 9        | Glacier Sun Glasses     |
    | 4        | Padded Socks            |
    | 3        | Hiking Boots            |
    | 7        | Back Country Shorts     |
  And I press "Place An Order"
  Then I should see the Place Order page
  And I should see the following order details:
    | Qty | Product Description       | Delivery Status | Unit Price | Total Price |
    | 15  | 3 Person Dome Tent        | To Be Shipped   | $ 299.99   | $ 4499.85   |
    | 2   | External Frame Backpack   | To Be Shipped   | $ 179.95   | $ 359.90    |
    | 9   | Glacier Sun Glasses       | To Be Shipped   | $ 67.99    | $ 611.91    |
    | 4   | Padded Socks              | To Be Shipped   | $ 19.99    | $ 79.96     |
    | 3   | Hiking Boots              | To Be Shipped   | $ 109.90   | $ 329.70    |
    | 7   | Back Country Shorts       | To Be Shipped   | $ 24.95    | $ 174.65    |
  And I should see the information bellow totally completed:
    | Product Total             | $ 6055.97   |
    | Sales Tax                 | $ 302.80    |
    | Shipping & Handling       | $ 5.00      |
    | Grand Total               | $ 6363.77   |

@maximize
Scenario: Placing a Big Order of a Single Item (3 Person Dome Tent)
  When I add the following items to the order:
    | Quantity | Item                   |
    | 1000      | 3 Person Dome Tent     |
  And I press "Place An Order"
  Then I should see the Place Order page
  And I should see the following order details:
    | Qty | Product Description       | Delivery Status | Unit Price | Total Price |
    | 1000| 3 Person Dome Tent        | To Be Shipped   | $ 299.99   | $ 299990.00  |
  And I should see the information bellow totally completed:
    | Product Total             | $ 299990.00  |
    | Sales Tax                 | $ 14999.50   |
    | Shipping & Handling       | $ 5.00      |
    | Grand Total               | $ 314994.50 |

@maximize
Scenario: Placing a Big Order of a Single Item (External Frame Backpack)
  When I add the following items to the order:
    | Quantity | Item                   |
    | 1000     | External Frame Backpack|
  And I press "Place An Order"
  Then I should see the Place Order page
  And I should see the following order details:
    | Qty | Product Description       | Delivery Status | Unit Price | Total Price |
    | 1000 | External Frame Backpack   | To Be Shipped   | $ 179.95   | $ 179950.00  |
  And I should see the information bellow totally completed:
    | Product Total             | $ 179950.00  |
    | Sales Tax                 | $ 8997.50    |
    | Shipping & Handling       | $ 5.00      |
    | Grand Total               | $ 188952.50  |


@maximize
Scenario: Placing a Big Order of a Single Item (Glacier Sun Glasses)
  When I add the following items to the order:
    | Quantity | Item                   |
    | 1000     | Glacier Sun Glasses    |
  And I press "Place An Order"
  Then I should see the Place Order page
  And I should see the following order details:
    | Qty  | Product Description       | Delivery Status | Unit Price | Total Price |
    | 1000 | Glacier Sun Glasses       | To Be Shipped   | $ 67.99    | $ 67990.00  |
  And I should see the information bellow totally completed:
    | Product Total             | $ 67990.00  |
    | Sales Tax                 | $ 3399.50   |
    | Shipping & Handling       | $ 5.00      |
    | Grand Total               | $ 71394.50  |

@maximize
Scenario: Placing a Big Order of a Single Item (Padded Socks)
  When I add the following items to the order:
    | Quantity | Item                   |
    | 1000     | Padded Socks           |
  And I press "Place An Order"
  Then I should see the Place Order page
  And I should see the following order details:
    | Qty  | Product Description       | Delivery Status | Unit Price | Total Price |
    | 1000 | Padded Socks              | To Be Shipped   | $ 19.99    | $ 19990.00  |
  And I should see the information bellow totally completed:
    | Product Total             | $ 19990.00  |
    | Sales Tax                 | $ 999.50    |
    | Shipping & Handling       | $ 5.00      |
    | Grand Total               | $ 20994.50  |
@maximize
Scenario: Placing a Big Order of a Single Item (Hiking Boots)
  When I add the following items to the order:
    | Quantity | Item                   |
    | 1000     | Hiking Boots           |
  And I press "Place An Order"
  Then I should see the Place Order page
  And I should see the following order details:
    | Qty | Product Description       | Delivery Status | Unit Price | Total Price |
    | 1000 | Hiking Boots              | To Be Shipped   | $ 109.90   | $ 109900.00  |
  And I should see the information bellow totally completed:
    | Product Total             | $ 10990.00  |
    | Sales Tax                 | $ 5495.00    |
    | Shipping & Handling       | $ 5.00      |
    | Grand Total               | $ 115400.00  |

@maximize
Scenario: Placing a Big Order of a Single Item (Back Country Shorts)
  When I add the following items to the order:
    | Quantity | Item                   |
    | 1000     | Back Country Shorts    |
  And I press "Place An Order"
  Then I should see the Place Order page
  And I should see the following order details:
    | Qty  | Product Description       | Delivery Status | Unit Price | Total Price |
    | 1000 | Back Country Shorts       | To Be Shipped   | $ 24.95    | $ 24950.00  |
  And I should see the information bellow totally completed:
    | Product Total             | $ 24950.00  |
    | Sales Tax                 | $ 1247.50   |
    | Shipping & Handling       | $ 5.00      |
    | Grand Total               | $ 26202.50  |




