class Node < ActiveRecord::Base
  attr_accessible :category_id, :city, :contact, :name, :street

  belongs_to :category
end
