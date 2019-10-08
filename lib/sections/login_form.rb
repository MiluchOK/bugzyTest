require_relative '../../lib/elements/field'

class LoginForm
  include PageObject

  page_section(:username_field, Field, id: 'username-field')
  page_section(:password_field, Field, id: 'password-field')
  elements(:error, css: '.error-message')
  element(:status, id: 'status')
  element(:loading_circle, css: '.loading-spinner')
  button(:login_button, id: 'login-button')

  def login(username, password)
    set_username(username)
    set_password(password)
    click_login
  end

  def set_username(username)
    username_field.send_keys(username)
  end

  def set_password(password)
    password_field.send_keys(password)
  end

  def get_password
    password_field.value
  end

  def get_username
    username_field.value
  end

  def click_login
    login_button
  end

  def login_button_disabled?
    login_button_element.disabled?
  end

  def get_error_messages
    error_elements.map { |e| e.text }
  end

  def get_status
    status_element.text
  end

  def loading_circle_present?
    loading_circle_element.exists?
  end
end
