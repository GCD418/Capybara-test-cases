require 'rspec/expectations'

# --- BACKGROUND ---
Given('I am on the GMO OnLine home page') do
  visit 'http://demo.borland.com/gmopost/'
end

Given('I navigate to the product catalog') do
  click_button('bSubmit')
end

# --- ACTIONS (WHEN) ---

When('I click the {string} button') do |button_name|
  case button_name
  when "Enter GMO OnLine"
    click_button('bSubmit')
  when "Place An Order"
    click_button('bSubmit')
  when "Reset Form"
    click_button('bReset')
  when "Proceed With Order"
    click_button('bSubmit')
  when "Process Order"
    click_button('bSubmit')
  else
    click_button(button_name)
  end
end

When('I click {string}') do |btn|
  step "I click the \"#{btn}\" button"
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
  fill_in('CardNumber', with: data['Card Number'])
  fill_in('CardDate', with: data['Exp Date'])
  select('Visa', from: 'CardType')
end

# --- VALIDATIONS (THEN) ---

Then('the quantity field for {string} should be empty') do |product|
  product_map = { "External Frame Backpack" => "QTY_BACKPACKS" }
  field_name = product_map[product]

  value = find_field(field_name).value
  expect(['', nil, '0']).to include(value)
end

Then('I should see the receipt with the title {string}') do |title|
  expect(page).to have_content(title)
  expect(page).to have_content('Thank you for shopping with GMO OnLine')
end
