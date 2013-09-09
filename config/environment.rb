# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Map::Application.initialize!


class Hash
	def &(other)
		reject { |k, v| !(other.include?(k)) }
	end
end

class Settings < Settingslogic
  source "#{Rails.root}/config/settings.yml"
  namespace Rails.env
end