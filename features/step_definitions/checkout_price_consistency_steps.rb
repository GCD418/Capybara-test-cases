When('the user adds the product {string} to the cart') do |product|
  @inventory_page = InventoryPage.new
  @inventory_page.add_product_to_cart(product)
end

When('the user goes to checkout overview') do
  @inventory_page.click_cart
  @cart_page = CartPage.new
  @cart_page.click_checkout
  @checkout_page = CheckoutPage.new
  @checkout_page.fill_information("Test", "User", "12345")
end



Then('the item total should equal the sum of the product prices') do
  cart_prices = @checkout_page.cart_item_prices
  expected_total = cart_prices.sum

  displayed_total = @checkout_page.item_total_value

  expect(displayed_total).to eq(expected_total)
end
