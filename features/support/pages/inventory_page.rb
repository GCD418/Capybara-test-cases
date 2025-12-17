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
end
