
# BACKGROUND


Given('I am on the GMO homepage') do
  visit 'http://demo.borland.com/gmopost/'
end

When('I click on {string}') do |button|
  click_button(button)
end


# ADD MULTIPLE ITEMS


When(/^I add the following items to the order:$/) do |table|
  table.hashes.each do |row|
    step %{I add #{row['Quantity']} "#{row['Item']}" to the order}
  end
end


# ADD SINGLE ITEM


When(/^I add (\d+) "([^"]*)" to the order$/) do |qty, item|
  product_map = {
    "3 Person Dome Tent"        => "QTY_TENTS",
    "External Frame Backpack"   => "QTY_BACKPACKS",
    "Glacier Sun Glasses"       => "QTY_GLASSES",
    "Padded Socks"              => "QTY_SOCKS",
    "Hiking Boots"              => "QTY_BOOTS",
    "Back Country Shorts"       => "QTY_SHORTS"
  }

  field = product_map[item]
  raise "Product not mapped: #{item}" if field.nil?

  fill_in(field, with: qty)
end

# PRESS BUTTON

When('I press {string}') do |button|
  click_button(button)
end

# VERIFY PLACE ORDER PAGE

Then('I should see the Place Order page') do
  expect(page).to have_content("Place Order")
end


# VERIFY ORDER DETAILS
Then(/^I should see the following order details:$/) do |table|
  product_table = page.all('table').find do |t|
    t.text.include?('Product Description') && t.text.include?('Qty')
  end

  table.hashes.each do |expected|
    description = expected['Product Description']
    qty         = expected['Qty']
    status      = expected['Delivery Status']
    unit_price  = expected['Unit Price']
    total_price = expected['Total Price']

    row = product_table.all('tr').find do |tr|
      tr.text.include?(description) &&
      tr.text.include?(qty) &&
      tr.text.include?(status) &&
      tr.text.include?(unit_price) &&
      tr.text.include?(total_price)
    end

    raise "Row not found for #{description}" if row.nil?

    expect(row).to have_content(description)
    expect(row).to have_content(qty)
    expect(row).to have_content(status)
    expect(row).to have_content(unit_price)
    expect(row).to have_content(total_price)
  end
end




# VERIFY TOTALS

Then(/^I should see the information bellow totally completed:$/) do |table|
  summary_table = page.all('table').find do |t|
    t.text.include?('Product Total') &&
    t.text.include?('Sales Tax') &&
    t.text.include?('Shipping & Handling')
  end

  table.rows.each do |label, value|
    row = summary_table.all('tr').find { |tr| tr.text.include?(label) }

    raise "Row not found for #{label}" if row.nil?

    expect(row).to have_content(value)
  end
end
