When('the user reviews the product descriptions') do
  @inventory_page = InventoryPage.new
end

Then('no product should have an empty description') do
  descriptions = @inventory_page.product_descriptions
  expect(descriptions.all? { |d| !d.strip.empty? }).to be true
end
