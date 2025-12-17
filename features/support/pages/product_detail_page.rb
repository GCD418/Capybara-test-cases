require_relative 'base_page'

class ProductDetailPage < BasePage
  def initialize
  end

  def get_product_name
    find('.inventory_details_name').text
  end

  def get_product_description
    find('.inventory_details_desc').text
  end

  def get_product_price
    find('.inventory_details_price').text
  end

  def has_description?
    has_selector?('.inventory_details_desc') && !get_product_description.empty?
  end

  def has_price?
    has_selector?('.inventory_details_price') && !get_product_price.empty?
  end
end
