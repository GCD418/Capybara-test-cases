When('the user views the inventory page') do
  @inventory_page = InventoryPage.new
end

Then('all product images should be loaded') do
  all('img.inventory_item_img').each do |img|
    src = img[:src]
    expect(src).not_to be_nil
    expect(src).not_to be_empty
  end
end
