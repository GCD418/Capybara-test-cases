Then(/^the Product Total should be the sum of all Total Prices$/) do
  # Identificar la tabla de productos usando encabezados
  product_table = page.all('table').find do |t|
    t.text.include?('Product Description') && t.text.include?('Qty')
  end

  # Extraer los totales por línea (Total Price)
  line_totals = product_table.all('tr').map do |tr|
    if tr.text =~ /\$ (\d+\.\d+)/
      tr.text.match(/\$ (\d+\.\d+)/)[1].to_f
    end
  end.compact

  calculated_sum = line_totals.sum

  # Encontrar Product Total en la tabla de resumen
  summary_table = page.all('table').find { |t| t.text.include?('Product Total') }

  product_total_row = summary_table.find('tr', text: /Product Total/i)
  product_total_value = product_total_row.text.match(/\$ (\d+\.\d+)/)[1].to_f

  expect(product_total_value).to eq(calculated_sum)
end
