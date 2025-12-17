When('the user logs out') do
  @inventory_page.logout
end

Then('the user should be redirected to the login page') do
  expect(page).to have_current_path('/')
end

When('the user adds {string} to the cart') do |product_name|
  @inventory_page.add_product_to_cart(product_name)
end

When('the user opens a new window with the same session') do
  @original_window = page.driver.browser.window_handles.first
  page.driver.browser.execute_script("window.open('#{Capybara.app_host}/inventory.html')")
  @new_window = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.window(@new_window)
end

Then('the cart should contain {int} item in the new window') do |expected_count|
  @inventory_page_new = InventoryPage.new
  expect(@inventory_page_new.get_cart_badge_count).to eq(expected_count)
end
