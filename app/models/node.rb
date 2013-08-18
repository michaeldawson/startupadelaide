class Node < ActiveRecord::Base
  attr_accessible :category_id, :city, :contact, :name, :street, :social_links_attributes
  attr_accessible :sponsor, :owner, :phone, :champion, :champion_contact

  belongs_to :category
  has_many :social_links

  accepts_nested_attributes_for :social_links

end