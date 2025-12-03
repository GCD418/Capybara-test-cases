Given(/^the user navigates to GMO main page$/) do
  visit('http://demo.borland.com/gmopost/')
end

When(/^the user selects "(.*?)"$/) do |link_text|
  # find('input[value="' + link_text + '"]').click
  click_button('bSubmit') 
end

Then(/^the page displays "(.*?)"$/) do |expected_message|
  message_locator = 'body > form > table > tbody > tr:nth-child(1) > td'
  expect(page).to have_selector(message_locator, text: expected_message)
end

Then(/^the content contains "(.*?)"$/) do |content_text|
  expect(page).to have_content(content_text)
end

Then(/^the catalog shows "([^"]*)" priced at "\$ ([\d\.]+)"$/) do |product_title, product_cost|
  product_title_locator = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr > td:nth-child(2) > a > strong"
  products_array = all(product_title_locator).map(&:text)
  
  product_index = products_array.index(product_title)
  raise "Product not found in catalog: #{product_title}" if product_index.nil?

  name_locator = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(#{product_index + 2}) > td:nth-child(2)"
  expect(page).to have_selector(name_locator, text: product_title)

  cost_locator = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(#{product_index + 2}) > td:nth-child(3)"
  expect(page).to have_selector(cost_locator, text: "$ #{product_cost}")
end

When(/^the user navigates to "About the GMO Site"$/) do
  about_button_selector = 'body > form > div:nth-child(1) > center > table > tbody > tr > td:nth-child(2) > input[type=button]'
  find(about_button_selector).click
end

Then(/^the information page loads successfully$/) do
  expect(page).to have_content('This is a sample online commerce application. It is not real.')
end

Then(/^these visual elements are present:$/) do |data_table|
  data_table.raw.flatten.each do |visual_element|
    expect(page).to have_content(visual_element)
  end
end

Then(/^the security notice appears on screen$/) do
  expect(page).to have_selector('font', text: 'For your privacy and security,')
  expect(page).to have_selector('font', text: 'DO NOT ENTER REAL BILLING OR SHIPPING INFORMATION')
end

When(/^navigating to "Browser Test Page"$/) do
  find('input[name="bBrowserTest"]').click
end

Then(/^the heading reads "(.*?)"$/) do |page_heading|
  expect(page).to have_content(page_heading)
end

Then(/^the browser list includes:$/) do |browser_data|
  browser_data.raw.flatten.each do |browser_name|
    expect(page).to have_selector('strong', text: browser_name)
  end
end

Then(/^the disclaimer states "(.*?)"$/) do |disclaimer_text|
  expect(page).to have_content(disclaimer_text)
end

Then(/^the sidebar displays:$/) do |sidebar_data|
  sidebar_data.raw.flatten.each do |sidebar_item|
    expect(page).to have_content(sidebar_item)
  end
end
