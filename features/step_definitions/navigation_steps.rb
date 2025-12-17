When('the user navigates to the cart') do
  @inventory_page.click_cart
  @cart_page = CartPage.new
end

When('the user clicks continue shopping') do
  @cart_page.click_continue_shopping
end

Then('the user should be on the inventory page') do
  expect(page).to have_current_path('/inventory.html')
end
