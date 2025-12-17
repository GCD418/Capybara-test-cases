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

  def fill_information(first_name, last_name, postal_code)
    fill_first_name(first_name)
    fill_last_name(last_name)
    fill_postal_code(postal_code)
    click_continue
  end

  def cart_item_prices
    all('.inventory_item_price').map { |p| p.text.gsub('$', '').to_f }
  end

  def item_total_value
    find('.summary_subtotal_label').text.gsub('Item total: $', '').to_f
  end

end


