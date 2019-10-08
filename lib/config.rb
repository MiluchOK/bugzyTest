require 'json'

class Config
  def self.get_base_path
    ENV['BASE_PATH'] || "https://miluchok.github.io/bugzy"
  end

  def self.default_timeout
    timeout = 5
    default_timeout = ENV['DEFAULT_TIMEOUT']
    if default_timeout
      timeout = default_timeout.to_i
    end
    timeout
  end
end
