class Category < ActiveRecord::Base
  attr_accessible :name, :size, :cat_class

  has_many :nodes

  before_create :set_cat_class

  def set_cat_class
  	self.cat_class=self.name.parameterize.underscore
  	puts "setting cat class to #{self.cat_class}"
  end
end
