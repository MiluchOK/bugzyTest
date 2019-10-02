require 'json'

class Config
  def self.get_base_path
    ENV['BASE_PATH'] || "https://miluchok.github.io/bugzy/"
  end
end
