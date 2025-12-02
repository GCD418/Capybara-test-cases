Feature: Complete Order Flow and Receipt Validation in GMO Online
  As an online customer
  I want to validate product pricing, totals and receipt details
  So that I can confirm that all calculations and shipping costs are correct

  Background:
    Given I am on the GMO homepage
    When I click on "Enter GMO Online"

  @maximize @single-item
  Scenario Outline: Validate a single-item order including totals and receipt
    When I add <Qty> "<Product>" to the shopping cart
    And I press "Place An Order"
    Then I should see the Place Order page
    And the order summary should display item information:
      | Qty | Product Description | Delivery Status | Unit Price | Total Price |
      | <Qty> | <Product> | <Delivery> | <UnitPrice> | <TotalPrice> |
    And the receipt should show:
      | Product Total       | <TotalPrice>   |
      | Sales Tax           | <Tax>          |
      | Shipping & Handling | $ 5.00         |
      | Grand Total         | <GrandTotal>   |

    Examples:
      | Qty | Product                 | Delivery        | UnitPrice | TotalPrice | Tax     | GrandTotal |
      | 1   | 3 Person Dome Tent      | To Be Shipped   | $ 299.99  | $ 299.99   | $ 15.00 | $ 319.99   |
      | 1   | External Frame Backpack | To Be Shipped   | $ 179.95  | $ 179.95   | $ 9.00  | $ 193.95   |

  @maximize @multi
  Scenario: Validate multiple products added to the cart
    When I add 2 "3 Person Dome Tent" to the shopping cart
    And I add 3 "Padded Socks" to the shopping cart
    And I press "Place An Order"
    Then I should see the Place Order page
    And the receipt should show:
      | Shipping & Handling | $ 5.00 |

  @maximize @unit-price
  Scenario: Validate unit prices on catalog
    Then the catalog should display correct unit prices:
      | Product                 | Price     |
      | 3 Person Dome Tent      | $ 299.99  |
      | External Frame Backpack | $ 179.95  |
      | Glacier Sun Glasses     | $ 67.99   |
      | Padded Socks            | $ 19.99   |

  @maximize @empty-qty
  Scenario: Validate empty quantities produce 0 total
    When I press "Place An Order"
    Then I should see the Place Order page
    And the receipt should show:
      | Product Total | $ 0.00 |

  @maximize @tax-validation
  Scenario: Validate tax calculation correctness
    When I add 1 "3 Person Dome Tent" to the shopping cart
    And I press "Place An Order"
    Then the receipt should show:
      | Sales Tax | $ 15.00 |
