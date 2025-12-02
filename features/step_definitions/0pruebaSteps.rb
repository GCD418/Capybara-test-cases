# --- GIVEN ---

# Given I navigate to the product catalog
Given('I navigate to the product catalog') do
  page.driver.browser.manage.window.maximize
  visit('http://demo.borland.com/gmopost/')
  click_button('bSubmit')  # Enter GMO OnLine
end


# --- WHEN ---

# When I select no products and click "Place An Order"
When('I select no products and click {string}') do |button_name|
  click_button('bSubmit')  # Place An Order
end

# When I enter quantity "4" for the product "3 Person Dome Tent"
When('I enter quantity {string} for the product {string}') do |qty, product|
  product_map = {
    "3 Person Dome Tent" => "QTY_TENTS",
    "External Frame Backpack" => "QTY_BACKPACKS",
    "Glacier Sun Glasses" => "QTY_GLASSES"
  }

  field_name = product_map[product]

  raise "Product not found: #{product}" if field_name.nil?

  fill_in(field_name, with: qty)
end

# Reusable button click
When('I click {string}') do |button|
  click_button(button)
end


# --- THEN ---

# Then I should see an alert with the message "Please order something first"
Then('I should see an alert with the message {string}') do |expected_message|
  sleep 3
  alert_text = accept_alert do
  sleep 3
  end
  expect(alert_text).to eq(expected_message)
end

# Then I should be on the "Place Order" page
Then('I should be on the {string} page') do |page_title|
  expect(page).to have_content(page_title)
end

# Then the line total should be "$ 1199.96"
Then('the line total should be {string}') do |expected_total|
  expect(page).to have_content(expected_total)
end
