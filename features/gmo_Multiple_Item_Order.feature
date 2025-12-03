Feature: Placing an Order with Multiple Items
  As a user
  I want to place an order with multiple items
  So that I can verify the total price of my order

  Background:
    Given I am on the GMO homepage
    When I click on "Enter GMO Online"

  @maximize
  Scenario: Adding 3 Person Dome Tent and External Frame Backpack
    When I add 1 "3 Person Dome Tent" to the order
    And I add 1 "External Frame Backpack" to the order
    And I press "Place An Order"
    Then I should see the Place Order page
    And I should see the following order details:
      | Qty | Product Description       | Delivery Status | Unit Price | Total Price |
      | 1   | 3 Person Dome Tent        | To Be Shipped   | $ 299.99   | $ 299.99    |
      | 1   | External Frame Backpack   | To Be Shipped   | $ 179.95   | $ 179.95    |
      And I should see that the Product Total information is the sum beetween de Total Prices:
      | Product Total | $ 479.94    |

  @maximize
  Scenario: Adding 3 Person Dome Tent and Glacier Sun Glasses
    When I add 1 "3 Person Dome Tent" to the order
    And I add 1 "Glacier Sun Glasses" to the order
    And I press "Place An Order"
    Then I should see the Place Order page
    And I should see the following order details:
      | Qty | Product Description       | Delivery Status | Unit Price | Total Price |
      | 1   | 3 Person Dome Tent        | To Be Shipped   | $ 299.99   | $ 299.99    |
      | 1   | Glacier Sun Glasses       | To Be Shipped   | $ 67.99    | $ 67.99     |
    And I should see that the Product Total information is the sum beetween de Total Prices:
      | Product Total | $ 367.98    |

  @maximize
  Scenario: Adding 3 Person Dome Tent and Padded Socks
    When I add 1 "3 Person Dome Tent" to the order
    And I add 1 "Padded Socks" to the order
    And I press "Place An Order"
    Then I should see the Place Order page
    And I should see the following order details:
      | Qty | Product Description       | Delivery Status | Unit Price | Total Price |
      | 1   | 3 Person Dome Tent        | To Be Shipped   | $ 299.99   | $ 299.99    |
      | 1   | Padded Socks              | To Be Shipped   | $ 19.99    | $ 19.99     |
    And I should see that the Product Total information is the sum beetween de Total Prices:
      | Product Total | $ 319.98    |

  @maximize
  Scenario: Adding 3 Person Dome Tent and Hiking Boots
    When I add 1 "3 Person Dome Tent" to the order
    And I add 1 "Hiking Boots" to the order
    And I press "Place An Order"
    Then I should see the Place Order page
    And I should see the following order details:
      | Qty | Product Description       | Delivery Status | Unit Price | Total Price |
      | 1   | 3 Person Dome Tent        | To Be Shipped   | $ 299.99   | $ 299.99    |
      | 1   | Hiking Boots              | To Be Shipped   | $ 109.90   | $ 109.90    |
    And I should see that the Product Total information is the sum beetween de Total Prices:
      | Product Total | $ 409.89    |

  @maximize
  Scenario: Adding 3 Person Dome Tent and Back Country Shorts
    When I add 1 "3 Person Dome Tent" to the order
    And I add 1 "Back Country Shorts" to the order
    And I press "Place An Order"
    Then I should see the Place Order page
    And I should see the following order details:
      | Qty | Product Description       | Delivery Status | Unit Price | Total Price |
      | 1   | 3 Person Dome Tent        | To Be Shipped   | $ 299.99   | $ 299.99    |
      | 1   | Back Country Shorts       | To Be Shipped   | $ 24.95    | $ 24.95     |
    And I should see that the Product Total information is the sum beetween de Total Prices:
      | Product Total | $ 324.94    |