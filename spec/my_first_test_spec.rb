require "selenium-webdriver"
require 'json'
require 'page-object'
require 'waitutil'
require_relative '../lib/pages/forms_page'

describe 'Bugzy Application' do

  let(:form_page) { FormsPage.new(@browser, visit=true) }

  it 'should verify an email is typed into the username field' do
    username = 'not a valid email'
    form_page.login_form.set_username(username)
    WaitUtil.wait_for_condition('error icon to appear', timeout_sec: 1, delay_sec: 0.1, verbose: true) do
      form_page.login_form.username_field.has_error == true
    end
  end

  it 'should disable show loading indicators during sign in' do
    form_page.login_form.login('', '')
    WaitUtil.wait_for_condition('login button to be disabled',
                                timeout_sec: 1,
                                delay_sec: 0.1,
                                verbose: true) do
      expect(form_page.login_form.login_button_disabled?).to eq(true)
    end
    expect(form_page.login_form.username_field.disabled?).to eq(true)
    expect(form_page.login_form.password_field.disabled?).to eq(true)
    expect(form_page.login_form.loading_circle_present?).to eq(true)
  end

  it 'should add a user' do
    form_page.users_box.add_new_user
    expect(form_page.users_box.get_users.size).to eq(1)
  end

  context 'with valid user' do

    let(:valid_user) do
      form_page.users_box.add_new_user
      form_page.users_box.get_users[0]
    end

    it 'should sign in' do
      form_page.login_form.login(valid_user['username'], valid_user['password'])
      expect(form_page.login_form.get_status).to eq('Success')
    end
  end

  context 'with invalid user' do

    let(:invalid_user) { {'username' => 'fooo@gmail.com', 'password' => 'foo'} }

    it 'should be rejected' do
      form_page.login_form.login(invalid_user['username'], invalid_user['password'])
      WaitUtil.wait_for_condition('error to show up', timeout_sec: 15, delay_sec: 0.5, verbose: true) do
        form_page.login_form.get_error_messages == ['Incorrect username or password']
      end
    end
  end
end