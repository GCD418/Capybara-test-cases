Feature: Error_user – intentional issues in inventory, cart, and checkout
  As a QA
  I want to validate the behavior of the error_user
  So that I can expose UI and flow failures (carga parcial, acciones que no responden)

  Background:
    Given I am on the SauceDemo login page
    When I login with username "error_user" and password "secret_sauce"
    Then I should be on the inventory page

  # Case 1: Partial load (page loads but not all content is rendered)
  Scenario: Inventory page loads but content is incomplete
    Then the inventory container should be visible
    And the inventory list should have at least 1 item
    And the page should not be completely blank

  # Case 2: Unreliable add to cart (expected unstable behavior: "0" or "1") (comportamiento inestable esperado)
  Scenario Outline: Add to cart is unreliable for some items (error_user)
    When I add "<itemName>" to the cart from inventory
    Then the cart badge should be "0" or "1"

    Examples:
      | itemName                          |
      | Sauce Labs Backpack               |
      | Sauce Labs Bike Light             |
      | Sauce Labs Bolt T-Shirt           |
      | Sauce Labs Fleece Jacket          |
      | Sauce Labs Onesie                 |
      | Test.allTheThings() T-Shirt (Red) |

  # Case 3: Checkout information cannot be completed correctly (intentional failure)
  Scenario: Checkout information cannot be completed successfully
    Given I have at least 1 item in the cart
    When I go to the cart
    And I start checkout
    Then I should see the checkout information form
    When I fill checkout information with first name "Rodrigo" last name "Perez" postal code "0000"
    Then I should move to checkout overview page

  # Case 4: Finish does not complete the purchase (expected to stay on overview) (no se completa la compra)
  Scenario: Finish does not complete the purchase (error_user)
    Given I am on the checkout overview page with at least 1 item
    When I finish checkout
    Then I should remain on the checkout overview page
