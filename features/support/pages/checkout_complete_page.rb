require_relative 'base_page'

class CheckoutCompletePage < BasePage
  def initialize
  end

  def get_confirmation_message
    find('.complete-header').text
  end

  def confirmation_displayed?
    has_selector?('.complete-header')
  end
end
