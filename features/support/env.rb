require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'selenium-webdriver'

require_relative 'pages/base_page'
require_relative 'pages/login_page'   # <-- FALTABA ESTO

Capybara.run_server = false
Capybara.default_max_wait_time = 10

Capybara.app_host = "https://www.saucedemo.com"

###########################################################
# DRIVER ESTABLE
###########################################################
Capybara.register_driver :selenium_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument("--disable-gpu")
  options.add_argument("--ignore-certificate-errors")
  options.add_argument("--disable-dev-shm-usage")
  options.add_argument("--no-sandbox")
  options.add_argument("--window-size=1400,900")

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options
  )
end

Capybara.default_driver = :selenium_chrome

