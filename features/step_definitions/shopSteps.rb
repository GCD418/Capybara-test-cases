Given('I am on the GMO OnLine home page') do
  visit '/'
end

Given('I navigate to the product catalog') do
  click_button('bSubmit') 
end


When('I click the {string} button') do |button_name|
  if button_name == "Enter GMO OnLine"
    click_button('bSubmit')
  elsif button_name == "Place An Order"
    click_button('bSubmit') 
  elsif button_name == "Reset Form"
    click_button('bReset')
  elsif button_name == "Proceed With Order"
    click_button('bSubmit')
  elsif button_name == "Process Order"
    click_button('bSubmit')
  else
    click_button(button_name)
  end
end

When('I click {string}') do |button_name|
  step "I click the \"#{button_name}\" button"
end

When('I select no products and click {string}') do |button|
  click_button('bSubmit')
end

When('I enter quantity {string} for the product {string}') do |quantity, product|
  product_map = {
    "3 Person Dome Tent" => "QTY_TENTS",
    "External Frame Backpack" => "QTY_BACKPACKS",
    "Glacier Sun Glasses" => "QTY_GLASSES",
    "Hiking Boots" => "QTY_BOOTS"
  }

  field_name = product_map[product]
  fill_in(field_name, with: quantity)
end

When('I fill the billing form with the following data:') do |table|
  data = table.rows_hash

  fill_in('billName', with: data['Name'])
  fill_in('billAddress', with: data['Address'])
  fill_in('billCity', with: data['City'])
  fill_in('billState', with: data['State'])
  fill_in('billZipCode', with: data['Zip'])
  fill_in('billPhone', with: data['Phone'])
  fill_in('billEmail', with: data['Email'])
  fill_in('CardNumber', with: data['Card Number'])
  fill_in('CardDate', with: data['Exp Date'])

  select('Visa', from: 'CardType')
end

Then('I should see the title {string}') do |expected_title|
  expect(page).to have_content(expected_title)
end

Then('I should see the list of available products') do
  expect(page).to have_table(class: 'c2')
  expect(page).to have_content('3 Person Dome Tent')
end

Then('I should see an alert with the message {string}') do |expected_message|
  alert_text = accept_alert do
  end
  expect(alert_text).to eq(expected_message)
rescue Capybara::ModalNotFound
  expect(page).to have_content(expected_message)
end

Then('I should be on the {string} page') do |page_title|
  expect(page).to have_content(page_title)
end

Then('the line total should be {string}') do |expected_total|
  expect(page).to have_content(expected_total)
end

Then('the quantity field for {string} should be empty') do |product|
  product_map = {
    "External Frame Backpack" => "QTY_BACKPACKS"
  }
  field_name = product_map[product]

  element = find_field(field_name)
  value = element.value

  # In some browsers empty is "" in others "0", checking both
  expect(['', '0', nil]).to include(value)
end

When(/^I add (\d+) "([^"]*)" to the order$/) do |quantity, item_name|
    
    product_name_css = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr > td:nth-child(2) > a > strong"
    product_names = all(product_name_css).map(&:text)
    index = product_names.index(item_name)
  
    specific_quantity_input_css = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(#{index + 2}) > td:nth-child(4) > h1 > input[type=text]"
    find(specific_quantity_input_css).set(quantity)
  end

When(/^I press "Reset Form"$/) do
  find('input[type=reset][name=bReset]').click
end

Then(/^the Order Quantity for "([^"]*)" should be 0$/) do |item_name|
  product_name_css = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr > td:nth-child(2) > a > strong"
  product_names = all(product_name_css).map(&:text)
  index = product_names.index(item_name)

  specific_quantity_input_css = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(#{index + 2}) > td:nth-child(4) > h1 > input[type=text]"
  expect(find(specific_quantity_input_css).value).to eq('0')
end


Then('I should see the receipt with the title {string}') do |title|
  expect(page).to have_content(title)
  expect(page).to have_content('Thank you for shopping with GMO OnLine')
end
