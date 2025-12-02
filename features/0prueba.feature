Feature: GMO OnLine testing
         Validating basic behavior of the Borland demo store

Scenario: Attempt to place an order without products
  Given I navigate to the product catalog
  When I select no products and click "Place An Order"
  Then I should see an alert with the message "Please Order Something First"


Scenario: Calculate total for a specific product
  Given I navigate to the product catalog
  When I enter quantity "4" for the product "3 Person Dome Tent"
  And I click "Place An Order"
  Then I should be on the "Place Order" page
  And the line total should be "$ 1199.96"
