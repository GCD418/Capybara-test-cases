Given('the user is logged in as {string}') do |username|
  @login_page = LoginPage.new
  visit '/'
  @login_page.login(username, "secret_sauce")
end

When('the user checks the inventory layout') do
  @inventory_page = InventoryPage.new
end

Then('every product card should be complete') do
  expect(@inventory_page.all_products_have_required_elements?).to be true
end
