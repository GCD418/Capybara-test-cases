
After do
  if page.driver.browser.window_handles.length > 1
    page.driver.browser.window_handles.each do |handle|
      page.driver.browser.switch_to.window(handle)
      page.driver.browser.close unless handle == page.driver.browser.window_handles.first
    end
  end
  Capybara.current_session.driver.quit
end

Before '@maximize' do
  page.driver.browser.manage.window.maximize
end

