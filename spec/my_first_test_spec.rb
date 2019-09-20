require 'rspec'
require "selenium-webdriver"

describe 'Bugzy Application' do
  before do
    # Do nothing
  end

  after do
    # Do nothing
  end

  it 'should render' do
    driver = Selenium::WebDriver.for :chrome
    driver.manage.timeouts.implicit_wait = 3
    driver.navigate.to "https://miluchok.github.io/bugzy/"
    login_button = driver.find_element(id: 'login-button')
    expect(login_button.displayed?).to eq(true)
  end
end