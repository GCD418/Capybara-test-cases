###########################################################
# UTILIDAD: REINTENTAR
###########################################################
def retry_action(max = 5, wait = 1)
  tries = 0
  begin
    yield
  rescue => e
    tries += 1
    if tries < max
      sleep wait
      retry
    else
      raise e
    end
  end
end

###########################################################
# GIVEN HOME PAGE
###########################################################
Given(/^I am on the GMO homepage$/) do
  visit('/')

  retry_action(5, 1) do
    # La página correcta debe mostrar esto
    raise "Home no cargó" unless page.has_content?("GMO OnLine")
  end
end

###########################################################
# CLICK ENTER GMO
# (IMPORTANTE: NO ES LINK, ES INPUT TYPE=BUTTON)
###########################################################
When(/^I click on "Enter GMO Online"$/) do
  retry_action(5, 1) do
    if page.has_button?("Enter GMO OnLine", wait: 5)
      click_button("Enter GMO OnLine")
    elsif page.has_selector?("input[value='Enter GMO OnLine']", wait: 5)
      find("input[value='Enter GMO OnLine']").click
    else
      raise "No aparece el botón Enter GMO OnLine"
    end
  end
end

###########################################################
# ADD PRODUCT
###########################################################
When(/^I add (\d+) "(.*)" to the shopping cart$/) do |qty, product_name|
  retry_action(5, 1) do
    row = page.all('tr').find { |r| r.text.include?(product_name) }
    raise "Producto #{product_name} no encontrado" if row.nil?

    input = row.all("input").first
    raise "No hay caja de texto para #{product_name}" if input.nil?

    input.fill_in(with: qty)
  end
end

###########################################################
# CLICK BUTTON
###########################################################
When(/^I press "([^"]*)"$/) do |text|
  retry_action(5, 1) { click_button(text) }
end

###########################################################
# VALIDAR PÁGINA
###########################################################
Then(/^I should see the Place Order page$/) do
  retry_action(5, 1) do
    raise "No estamos en Place Order" unless page.has_content?("Place Order")
  end
end

###########################################################
# VALIDAR ORDER SUMMARY
###########################################################
Then(/^the order summary should display item information:$/) do |table|
  expected = table.hashes.first

  retry_action(5, 1) do
    summary = page.all("table").find { |t| t.text.include?("Qty") && t.text.include?("Product Description") }
    raise "No se encontró tabla de resumen" if summary.nil?

    txt = summary.text

    raise "No coincide producto" unless txt.include?(expected["Product Description"])
    raise "No coincide Unit Price" unless txt.include?(expected["Unit Price"])
    raise "No coincide Total Price" unless txt.include?(expected["Total Price"])
  end
end

###########################################################
# VALIDAR RECIBO
###########################################################
Then(/^the receipt should show:$/) do |table|
  expected = table.hashes

  retry_action(5, 1) do
    receipt = page.all("table").find { |t| t.text.include?("Grand Total") }
    raise "No se encontró tabla de recibo" if receipt.nil?

    txt = receipt.text

    expected.each do |row|
      value = row.values.first
      raise "No se encontró valor esperado: #{value}" unless txt.include?(value)
    end
  end
end

###########################################################
# VALIDAR PRECIOS UNITARIOS
###########################################################
Then(/^the catalog should display correct unit prices:$/) do |table|
  expected = table.hashes

  retry_action(5, 1) do
    expected.each do |row|
      product = row["Product"]
      price   = row["Price"]

      row_found = page.all("tr").find { |r| r.text.include?(product) }
      raise "Producto #{product} no encontrado" if row_found.nil?

      raise "Precio incorrecto para #{product}" unless row_found.text.include?(price)
    end
  end
end
