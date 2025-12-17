require_relative 'base_page'

class CheckoutPage < BasePage
  def initialize
  end

  def fill_first_name(first_name)
    fill_in 'first-name', with: first_name
  end

  def fill_last_name(last_name)
    fill_in 'last-name', with: last_name
  end

  def fill_postal_code(postal_code)
    fill_in 'postal-code', with: postal_code
  end

  def click_continue
    click_button 'continue'
  end

  def error_displayed?
    has_selector?('[data-test="error"]')
  end

  def error_message
    find('[data-test="error"]').text
  end
end
