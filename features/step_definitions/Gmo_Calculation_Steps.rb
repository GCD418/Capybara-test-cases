
# ========== BACKGROUND STEPS ==========
Given(/^I am on the GMO homepage$/) do
  visit 'http://demo.borland.com/gmopost/'
end

When(/^I click on "Enter GMO Online"$/) do
  click_button('bSubmit')
end



# ========== ADD MULTIPLE ITEMS ==========
When(/^I add the following items to the order:$/) do |table|
  product_map = {
    "3 Person Dome Tent"       => "QTY_TENTS",
    "External Frame Backpack"  => "QTY_BACKPACKS",
    "Glacier Sun Glasses"      => "QTY_GLASSES",
    "Padded Socks"             => "QTY_SOCKS",
    "Hiking Boots"             => "QTY_BOOTS",
    "Back Country Shorts"      => "QTY_SHORTS"
  }

  table.hashes.each do |row|
    qty = row['Quantity']
    product = row['Item']

    field_name = product_map[product]
    raise "Product not mapped: #{product}" if field_name.nil?

    fill_in(field_name, with: qty)
  end
end



# ========== PRESS BUTTON ==========
When(/^I press "(.+)"$/) do |button|
  click_button(button)
end



# ========== VERIFY PLACE ORDER PAGE ==========
Then(/^I should see the Place Order page$/) do
  expect(page).to have_content("Place Order")
end



# ========== VERIFY PRODUCT DETAILS TABLE ==========
Then(/^I should see the following order details in the first table:$/) do |table|
  # Identificar la tabla de productos por encabezados
  product_table = page.all('table').find do |t|
    t.text.include?('Product Description') && t.text.include?('Qty')
  end

  table.hashes.each do |expected|
    description = expected["Product Description"]
    qty         = expected["Qty"]
    unit        = expected["Unit Price"]
    total       = expected["Total Price"]

    # Buscar fila que contenga TODOS los valores esperados
    row = product_table.all('tr').find do |tr|
      tr.text.include?(description) &&
      tr.text.include?(qty) &&
      tr.text.include?(unit) &&
      tr.text.include?(total)
    end

    raise "Row not found for #{description}" if row.nil?

    # Validaciones explícitas
    expect(row).to have_content(description)
    expect(row).to have_content(qty)
    expect(row).to have_content(unit)
    expect(row).to have_content(total)
  end
end



# ========== VERIFY TOTALS (BOTTOM TABLE) ==========
Then(/^I should see the following totals right down:$/) do |table|
  # Identificar tabla de totales
  summary_table = page.all('table').find do |t|
    t.text.include?('Product Total') &&
    t.text.include?('Sales Tax') &&
    t.text.include?('Grand Total')
  end

  table.rows.each do |label, expected_value|
    # Buscar fila específica por etiqueta
    row = summary_table.find('tr', text: /#{label}/i)

    # Extraer número real mostrado en la tabla
    actual_value = row.text.match(/\d+\.\d+/)[0]

    expect(actual_value).to eq(expected_value)
  end
end
