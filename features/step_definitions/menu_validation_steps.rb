Given('the user opens the menu') do
  @inventory_page = InventoryPage.new
  @inventory_page.open_menu
end

Then('the menu should contain all required options') do
  expected_options = [
    'All Items', 
    'About', 
    'Logout', 
    'Reset App State'
  ]

  expected_options.each do |option|
    expect(page).to have_selector('#react-burger-menu-btn')
    expect(page).to have_content(option)
  end
end
