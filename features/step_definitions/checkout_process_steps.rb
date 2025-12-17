Given('the user proceeds to checkout overview') do
  @cart_page.click_checkout
  @checkout_page = CheckoutPage.new
  @checkout_page.fill_information('John', 'Doe', '12345')
  @checkout_overview_page = CheckoutOverviewPage.new
end

Then('the item total should match the sum of all product prices') do
  expected_total = @checkout_overview_page.get_item_prices.sum.round(2)
  actual_total = @checkout_overview_page.get_item_total
  expect(actual_total).to eq(expected_total)
end

Then('the tax amount should be correctly calculated') do
  item_total = @checkout_overview_page.get_item_total
  tax = @checkout_overview_page.get_tax
  expected_tax = (item_total * 0.08).round(2)
  expect(tax).to eq(expected_tax)
end

Then('the total amount should equal item total plus tax') do
  item_total = @checkout_overview_page.get_item_total
  tax = @checkout_overview_page.get_tax
  total = @checkout_overview_page.get_total
  expected_total = (item_total + tax).round(2)
  expect(total).to eq(expected_total)
end

When('the user clicks finish') do
  @checkout_overview_page.click_finish
end

Then('a confirmation message should be displayed') do
  @checkout_complete_page = CheckoutCompletePage.new
  expect(@checkout_complete_page.confirmation_displayed?).to be true
end

Then('the confirmation should contain {string}') do |expected_text|
  expect(@checkout_complete_page.get_confirmation_message).to include(expected_text)
end
