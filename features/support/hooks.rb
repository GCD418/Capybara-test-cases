After do
  
  if page.driver.browser.window_handles.length > 1
    main = page.driver.browser.window_handles.first
    page.driver.browser.window_handles.each do |handle|
      next if handle == main
      page.driver.browser.switch_to.window(handle)
      page.driver.browser.close
    end
    page.driver.browser.switch_to.window(main)
  end
  
  
  Capybara.reset_sessions!
end

Before '@maximize' do
  page.driver.browser.manage.window.maximize
end

