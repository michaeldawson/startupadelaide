class Category < ActiveRecord::Base
  attr_accessible :name, :size, :cat_class

  has_many :nodes
end
