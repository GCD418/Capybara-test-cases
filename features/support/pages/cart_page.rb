require_relative 'base_page'

class CartPage < BasePage
  def initialize
  end

  def get_cart_items_count
    all('.cart_item').count
  end

  def cart_is_empty?
    !has_selector?('.cart_item')
  end

  def remove_all_items
    all('.cart_button').each(&:click)
  end

  def click_checkout
    click_button 'checkout'
  end
end
