When('the user adds all products to the cart') do
  @inventory_page.add_all_products_to_cart
end

Then('all products should be in the cart') do
  @inventory_page.click_cart
  @cart_page = CartPage.new
  expect(@cart_page.get_cart_items_count).to eq(6)
end

Given('the user has added all products to the cart') do
  @inventory_page.add_all_products_to_cart
  @inventory_page.click_cart
  @cart_page = CartPage.new
end

When('the user removes all products from the cart') do
  @cart_page.remove_all_items
end

Then('the cart should be empty') do
  expect(@cart_page.cart_is_empty?).to be true
end
