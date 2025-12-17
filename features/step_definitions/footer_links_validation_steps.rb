When('the user clicks the Twitter footer link') do
  find('a[href="https://twitter.com/saucelabs"]').click
end

When('the user clicks the Facebook footer link') do
  find('a[href="https://www.facebook.com/saucelabs"]').click
end

When('the user clicks the LinkedIn footer link') do
  find('a[href="https://www.linkedin.com/company/sauce-labs/"]').click
end

Then('the current URL should contain {string}') do |expected_url|
  # cambia a la nueva pestaña si se abre en otra
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  expect(page.current_url).to include(expected_url)
end
