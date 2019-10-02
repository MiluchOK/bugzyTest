class LoginForm
  include PageObject

  text_field(:username_field, css: '#username-field input')
  text_field(:password_field, css: '#password-field input')
  element(:status, id: 'status')
  button(:login_button, id: 'login-button')

  def login(username, password)
    username_field_element.send_keys(username)
    password_field_element.send_keys(password)
    login_button
  end

  def get_status
    status_element.text
  end
end
