#encoding: UTF-8

class Node < ActiveRecord::Base
  attr_accessible :category_id, :city, :contact, :name, :street, :social_links_attributes
  attr_accessible :sponsor, :description, :owner, :phone, :champion, :champion_contact

  belongs_to :category
  has_many :social_links

  accepts_nested_attributes_for :social_links

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
		
			n=Node.create! (row.to_hash & Node.new.attributes)

			#[row['prime_category'], row['2nd_category']].each do |c|
			#	n.categories << Category.find_or_create_by_name(c)
			#end

			n.category = Category.find_or_create_by_name(row['prime_category'])
			n.save

			puts n.category.name
			#puts (row.to_hash & Node.new.attributes)
		end
	end
end