class Target < ActiveRecord::Base

  def css_friendly_name
  	self.name.parameterize.underscore
  end
end
