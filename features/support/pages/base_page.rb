class BasePage
  include Capybara::DSL

  def initialize
    visit('/')
  end

  def current_url
    page.current_url
  end
end
