Given('the user is on the login page') do
  @login_page = LoginPage.new
end

When('the user logs in with username {string} and password {string}') do |username, password|
  @login_page.login(username, password)
end

When('the user attempts to login without entering credentials') do
  @login_page.click_login_button
end

Then('the user should be redirected to the inventory page') do
  expect(page).to have_current_path('/inventory.html')
end

Then('an error message should be displayed') do
  expect(@login_page.error_displayed?).to be true
end

Then('the error message should contain {string}') do |expected_text|
  expect(@login_page.error_message).to include(expected_text)
end
