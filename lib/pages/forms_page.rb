require 'page-object'
require_relative 'base_page'
require_relative '../config'
require_relative '../sections/login_form'
require_relative '../sections/users_box'

class FormsPage < BasePage
  include PageObject

  page_url Config.get_base_path

  page_section(:login_form, LoginForm, css: '#pageRoot #paper:first-of-type')
  page_section(:users_box, UsersBox, css: '#pageRoot #paper:nth-of-type(2)')

end
