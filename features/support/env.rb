require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'selenium-webdriver'

require_relative 'pages/base_page'
require_relative 'pages/login_page'
require_relative 'pages/inventory_page'
require_relative 'pages/cart_page'
require_relative 'pages/product_detail_page'   

Capybara.run_server = false
Capybara.default_max_wait_time = 10

Capybara.app_host = "https://www.saucedemo.com"

###########################################################
# DRIVER ESTABLE
###########################################################
Capybara.register_driver :selenium_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--disable-infobars')
  options.add_argument('--disable-notifications')
  options.add_argument('--disable-save-password-bubble')
  options.add_argument('--disable-extensions')
  options.add_argument('--disable-popup-blocking')
  options.add_argument('--disable-blink-features=AutomationControlled')
  options.add_argument('--incognito')

  options.add_argument("--disable-gpu")
  options.add_argument("--ignore-certificate-errors")
  options.add_argument("--disable-dev-shm-usage")
  options.add_argument("--no-sandbox")
  options.add_argument("--window-size=1400,900")

  prefs = {
    'profile.default_content_setting_values.notifications' => 2,
    'profile.password_manager_enabled' => false,
    'credentials_enable_service' => false,
    'profile.default_content_settings.popups' => 0
  }
  options.prefs = prefs
  
  options.exclude_switches << 'enable-automation'

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options
  )
end

Capybara.default_driver = :selenium_chrome

