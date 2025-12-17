require_relative 'base_page'

class InventoryPage < BasePage
  def initialize
  end

  def sort_products(sort_option)
    case sort_option
    when "Name (A to Z)"
    #   select('Name (A to Z)', from: 'product_sort_container')
      select('az', from: 'product_sort_container')
    when "Name (Z to A)"
    #   select('Name (Z to A)', from: 'product_sort_container')
      select('za', from: 'product_sort_container')
    when "Price (low to high)"
      select('Price (low to high)', from: 'product_sort_container')
    when "Price (high to low)"
      select('Price (high to low)', from: 'product_sort_container')
    end
  end

  def get_product_names
    all('.inventory_item_name').map(&:text)
  end

  def get_product_prices
    all('.inventory_item_price').map { |price| price.text.gsub('$', '').to_f }
  end
end
