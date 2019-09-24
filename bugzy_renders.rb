require "selenium-webdriver"
require 'json'
require "rspec"

include RSpec::Matchers

driver = Selenium::WebDriver.for :chrome
driver.navigate.to 'https://miluchok.github.io/bugzy/'
login_button = driver.find_element(id: 'login-button')
expect(login_button.displayed?).to eq(true)
add_user_button = driver.find_element(id: 'add-user')
add_user_button.click
add_user_button.click
users = driver.find_element(id: 'jsonText')
parsed = JSON.parse(users.text)

username_field = driver.find_element(css: '#username-field input')
password_field = driver.find_element(css: '#password-field input')

user = parsed[0]

sleep(3)


username_field.send_keys(user['username'])
password_field.send_keys(user['password'])
login_button.click
sleep(3)

status = driver.find_element(id: 'status')
expect(status.text).to eq('Success')
