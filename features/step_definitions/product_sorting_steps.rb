Given('the user is logged in as standard user') do
  @login_page = LoginPage.new
  @login_page.login('standard_user', 'secret_sauce')
end

Given('the user is on the inventory page') do
  @inventory_page = InventoryPage.new
  expect(page).to have_current_path('/inventory.html')
end

When('the user sorts products by {string}') do |sort_option|
  @inventory_page.sort_products(sort_option)
end

Then('the products should be sorted alphabetically ascending') do
  product_names = @inventory_page.get_product_names
  expect(product_names).to eq(product_names.sort)
end

Then('the products should be sorted alphabetically descending') do
  product_names = @inventory_page.get_product_names
  expect(product_names).to eq(product_names.sort.reverse)
end

Then('the products should be sorted by price ascending') do
  product_prices = @inventory_page.get_product_prices
  expect(product_prices).to eq(product_prices.sort)
end

Then('the products should be sorted by price descending') do
  product_prices = @inventory_page.get_product_prices
  expect(product_prices).to eq(product_prices.sort.reverse)
end
