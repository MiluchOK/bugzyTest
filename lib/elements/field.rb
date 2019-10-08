require 'waitutil'

class Field
  include PageObject

  element(:input, css: 'input')
  element(:error, css: '.field-error')

  def send_keys(text)
    input_element.send_keys(text)
  end

  def get_value
    input_element.value
  end

  def has_error
    error_element.exists?
  end

  def disabled?
    input_element.disabled?
  end
end