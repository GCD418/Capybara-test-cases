When('the user resets the app state') do
  @inventory_page.open_menu
  click_link('Reset App State')
end

Then('the cart badge should not be visible') do
  expect(page).not_to have_selector('.shopping_cart_badge')
end
