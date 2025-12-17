When('the user clicks on {string} product') do |product_name|
  @inventory_page.click_product(product_name)
end

Then('the product detail page should display the product name {string}') do |expected_name|
  @product_detail_page = ProductDetailPage.new
  expect(@product_detail_page.get_product_name).to eq(expected_name)
end

Then('the product detail page should display a description') do
  expect(@product_detail_page.has_description?).to be true
end

Then('the product detail page should display a price') do
  expect(@product_detail_page.has_price?).to be true
end
