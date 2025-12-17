require_relative 'base_page'

class CheckoutOverviewPage < BasePage
  def initialize
  end

  def get_item_prices
    all('.inventory_item_price').map { |price| price.text.gsub('$', '').to_f }
  end

  def get_item_total
    find('.summary_subtotal_label').text.gsub('Item total: $', '').to_f
  end

  def get_tax
    find('.summary_tax_label').text.gsub('Tax: $', '').to_f
  end

  def get_total
    find('.summary_total_label').text.gsub('Total: $', '').to_f
  end

  def click_finish
    click_button 'finish'
  end
end
