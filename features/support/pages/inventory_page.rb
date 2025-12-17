require_relative 'base_page'

class InventoryPage < BasePage
  def initialize
  end

  def sort_products(sort_option)
    case sort_option
    when "Name (A to Z)"
      find('.product_sort_container').select('Name (A to Z)')
    #   select('az', from: 'product_sort_container')
    # Select busca por id. No por clase
    when "Name (Z to A)"
      find('.product_sort_container').select('Name (Z to A)')
    when "Price (low to high)"
      find('.product_sort_container').select('Price (low to high)')
    when "Price (high to low)"
      find('.product_sort_container').select('Price (high to low)')
    end
  end

  def get_product_names
    all('.inventory_item_name').map(&:text)
  end

  def get_product_prices
    all('.inventory_item_price').map { |price| price.text.gsub('$', '').to_f }
  end

  def add_all_products_to_cart
    all('.btn_inventory').each(&:click)
  end

  def get_cart_badge_count
    return 0 unless has_selector?('.shopping_cart_badge')
    find('.shopping_cart_badge').text.to_i
  end

  def click_cart
    find('.shopping_cart_link').click
  end
end
