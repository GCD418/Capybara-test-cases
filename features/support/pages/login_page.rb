require_relative 'base_page'

class LoginPage < BasePage
  def fill_username(username)
    fill_in 'user-name', with: username
  end

  def fill_password(password)
    fill_in 'password', with: password
  end

  def click_login_button
    click_button 'Login'
  end

  def login(username, password)
    fill_username(username)
    fill_password(password)
    click_login_button
  end

  def error_message
    find('[data-test="error"]').text
  end

  def error_displayed?
    has_selector?('[data-test="error"]')
  end

  def visit_page
  visit "https://www.saucedemo.com/"
  end
  
  def login_button_visible?
  has_selector?("#login-button", wait: 10)
  end 

end
