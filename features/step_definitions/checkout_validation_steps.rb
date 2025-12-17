Given('the user is on the checkout information page') do
  @cart_page.click_checkout
  @checkout_page = CheckoutPage.new
end

When('the user fills checkout form with last name {string} and postal code {string}') do |last_name, postal_code|
  @checkout_page.fill_last_name(last_name)
  @checkout_page.fill_postal_code(postal_code)
end

When('the user fills checkout form with first name {string} and postal code {string}') do |first_name, postal_code|
  @checkout_page.fill_first_name(first_name)
  @checkout_page.fill_postal_code(postal_code)
end

When('the user fills checkout form with first name {string} and last name {string}') do |first_name, last_name|
  @checkout_page.fill_first_name(first_name)
  @checkout_page.fill_last_name(last_name)
end

When('the user clicks continue on checkout') do
  @checkout_page.click_continue
end

Then('an error message should be displayed on checkout') do
  expect(@checkout_page.error_displayed?).to be true
end

Then('the checkout error should contain {string}') do |expected_text|
  expect(@checkout_page.error_message).to include(expected_text)
end
