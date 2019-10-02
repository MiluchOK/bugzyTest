require 'json'

class UsersBox
  include PageObject

  button(:add_user, id: 'add-user')
  element(:users_list, id: 'jsonText')

  def add_new_user
    self.add_user
  end

  def get_users
    JSON.parse(self.users_list_element.text)
  end
end
