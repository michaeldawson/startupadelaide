class Category < ActiveRecord::Base
  has_many :nodes

  def css_friendly_name
    self.name.parameterize.underscore
  end
end
