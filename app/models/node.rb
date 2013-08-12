class Node < ActiveRecord::Base
  attr_accessible :category_id, :city, :contact, :name, :street, :what, :who_for, :more, :social_links_attributes

  belongs_to :category
  has_many :social_links

  accepts_nested_attributes_for :social_links
  

end
