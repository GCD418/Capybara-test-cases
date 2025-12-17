When('the user attempts to checkout from empty cart') do
  @cart_page.click_checkout
end

Then('an error should prevent the checkout process') do
  expect(page).to have_current_path('/cart.html')
  expect(page).to have_content('Your cart is empty')
end
