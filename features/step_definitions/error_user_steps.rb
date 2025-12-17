
# Login and inventory

Given("I am on the SauceDemo login page") do
  visit "https://www.saucedemo.com/"
  expect(page).to have_selector("#login-button", wait: 10)
end

When("I login with username {string} and password {string}") do |username, password|
  find("#user-name").set(username)
  find("#password").set(password)
  find("#login-button").click
end

Then("I should be on the inventory page") do
  expect(page).to have_current_path(/inventory\.html/, wait: 10)
  expect(page).to have_selector("#inventory_container", wait: 10)
end

Then("the inventory container should be visible") do
  expect(page).to have_selector("#inventory_container", visible: true, wait: 10)
end

Then("the inventory list should have at least {int} item") do |min_count|
  items = all(".inventory_item", wait: 10)
  expect(items.length).to be >= min_count
end

Then("the page should not be completely blank") do
  # Simple validation: visible body with content (verifica carga parcial)
  expect(page).to have_selector("body", visible: true)
  expect(page.text.strip.length).to be > 0
end


# Cart behavior (error_user)

When("I add {string} to the cart from inventory") do |item_name|
  # Locate the product block by name and click its button
  item = find(".inventory_item", text: item_name, match: :first)
  button = item.find("button")

  # Click only if the button is "Add to cart"
  button.click if button.text.downcase.include?("add")
end

Then("the cart badge should show {string}") do |expected|
  # If the bug prevents adding, the badge may not exist (treated as "0")
  actual =
    if page.has_selector?(".shopping_cart_badge", wait: 2)
      find(".shopping_cart_badge").text.strip
    else
      "0"
    end

  expect(actual).to eq(expected)
end

Then('the cart badge should be {string} or {string}') do |a, b|
  # Flexible assertion to reflect unstable behavior (fallo intencional)
  actual =
    if page.has_selector?(".shopping_cart_badge", wait: 2)
      find(".shopping_cart_badge").text.strip
    else
      "0"
    end

  expect([a, b]).to include(actual)
end

Given("I have at least {int} item in the cart") do |min_count|
  # Attempt to add one base item if the cart is empty
  unless page.has_selector?(".shopping_cart_badge", wait: 2)
    step %(I add "Sauce Labs Backpack" to the cart from inventory)
  end

  count =
    if page.has_selector?(".shopping_cart_badge", wait: 2)
      find(".shopping_cart_badge").text.to_i
    else
      0
    end

  expect(count).to be >= min_count
end


# Cart and checkout

When("I go to the cart") do
  find(".shopping_cart_link").click
  expect(page).to have_current_path(/cart\.html/, wait: 10)
end

When("I start checkout") do
  find("#checkout").click
end

Then("I should see the checkout information form") do
  expect(page).to have_current_path(/checkout-step-one\.html/, wait: 10)
  expect(page).to have_selector("#first-name", wait: 10)
  expect(page).to have_selector("#last-name", wait: 10)
  expect(page).to have_selector("#postal-code", wait: 10)
end

When(
  "I fill checkout information with first name {string} last name {string} postal code {string}"
) do |first, last, postal|
  find("#first-name").set(first)
  find("#last-name").set(last)
  find("#postal-code").set(postal)
end

When("I continue checkout") do
  find("#continue").click
end

Then("I should move to checkout overview page") do
  expect(page).to have_current_path(/checkout-step-two\.html/, wait: 10)
  expect(page).to have_selector(".summary_info", wait: 10)
end

Given("I am on the checkout overview page with at least {int} item") do |min_count|
  # (evita duplicación)
  step %(I have at least #{min_count} item in the cart)
  step %(I go to the cart)
  step %(I start checkout)
  step %(I should see the checkout information form)
  step %(I fill checkout information with first name "Rodrigo" last name "Perez" postal code "0000")
  step %(I continue checkout)
  step %(I should move to checkout overview page)
end


# Finish behavior (error_user)
When("I finish checkout") do
  find("#finish").click
end

Then("I should see the checkout complete page") do
  expect(page).to have_current_path(/checkout-complete\.html/, wait: 10)
  expect(page).to have_selector(".complete-header", wait: 10)
end

Then("the {string} button should be visible") do |button_text|
  # On complete page, the button is "Back Home"
  expect(page).to have_button(button_text, wait: 10)
end

Then("I should remain on the checkout overview page") do
  # Finish does not complete the purchase (bug intencional)
  expect(page).to have_current_path(/checkout-step-two\.html/, wait: 10)
end

Then('the cart badge should be {string} or {string} (comportamiento inestable esperado)') do |a, b|
  actual =
    if page.has_selector?(".shopping_cart_badge", wait: 2)
      find(".shopping_cart_badge").text.strip
    else
      "0"
    end

  expect([a, b]).to include(actual)
end

Then('I should remain on the checkout overview page (no se completa la compra)') do
  expect(page).to have_current_path(/checkout-step-two\.html/, wait: 10)
end
