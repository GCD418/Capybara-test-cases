# frozen_string_literal: true

require_relative '../support/pages/login_page'
require_relative '../support/pages/inventory_page'
require_relative '../support/pages/cart_page'
require_relative '../support/pages/checkout_page'
require_relative '../support/pages/checkout_overview_page'

Given("I am on the SauceDemo login page") do
  @login_page = LoginPage.new
  @login_page.visit_page
  expect(@login_page.login_button_visible?).to be true
end

When("I login with username {string} and password {string}") do |username, password|
  @login_page ||= LoginPage.new
  @login_page.login(username, password)
end

Then("I should be on the inventory page") do
  expect(page).to have_current_path(/inventory\.html/, wait: 10)
  @inventory_page = InventoryPage.new
  expect(@inventory_page.inventory_container_visible?).to be true
end

Then("the inventory container should be visible") do
  @inventory_page ||= InventoryPage.new
  expect(@inventory_page.inventory_container_visible?).to be true
end

Then("the inventory list should have at least {int} item") do |min_count|
  @inventory_page ||= InventoryPage.new
  expect(@inventory_page.items_count).to be >= min_count
end

Then("the page should not be completely blank") do
  @inventory_page ||= InventoryPage.new
  expect(@inventory_page.page_not_blank?).to be true
end

When("I add {string} to the cart from inventory") do |item_name|
  @inventory_page ||= InventoryPage.new
  @inventory_page.add_to_cart_by_name(item_name)
end

Then('the cart badge should be {string} or {string}') do |a, b|
  @inventory_page ||= InventoryPage.new
  actual = @inventory_page.cart_badge_text
  expect([a, b]).to include(actual)
end

Given("I have at least {int} item in the cart") do |min_count|
  @inventory_page ||= InventoryPage.new

  if @inventory_page.cart_badge_text == "0"
    @inventory_page.add_to_cart_by_name("Sauce Labs Backpack")
  end

  expect(@inventory_page.cart_badge_text.to_i).to be >= min_count
end

When("I go to the cart") do
  @inventory_page ||= InventoryPage.new
  @inventory_page.go_to_cart
  expect(page).to have_current_path(/cart\.html/, wait: 10)
  @cart_page = CartPage.new
end

When("I start checkout") do
  @cart_page ||= CartPage.new
  @cart_page.click_checkout
end

Then("I should see the checkout information form") do
  expect(page).to have_current_path(/checkout-step-one\.html/, wait: 10)
  @checkout_page = CheckoutPage.new
  expect(page).to have_selector("#first-name", wait: 10)
  expect(page).to have_selector("#last-name", wait: 10)
  expect(page).to have_selector("#postal-code", wait: 10)
end

When("I fill checkout information with first name {string} last name {string} postal code {string}") do |first, last, postal|
  @checkout_page ||= CheckoutPage.new
  @checkout_page.fill_information(first, last, postal)
end

Then("I should move to checkout overview page") do
  expect(page).to have_current_path(/checkout-step-two\.html/, wait: 10)
  @overview_page = CheckoutOverviewPage.new
end

Given("I am on the checkout overview page with at least {int} item") do |min_count|
  step %(I have at least #{min_count} item in the cart)
  step %(I go to the cart)
  step %(I start checkout)
  step %(I should see the checkout information form)
  step %(I fill checkout information with first name "Rodrigo" last name "Perez" postal code "0000")
  step %(I should move to checkout overview page)
end

When("I finish checkout") do
  @overview_page ||= CheckoutOverviewPage.new
  @overview_page.click_finish
end

Then("I should remain on the checkout overview page") do
  expect(page).to have_current_path(/checkout-step-two\.html/, wait: 10)
end
