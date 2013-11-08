#encoding: UTF-8

class Node < ActiveRecord::Base
  attr_accessible :category_id, :city, :contact, :name, :street, :social_links_attributes
  attr_accessible :sponsor, :description, :owner, :phone, :champion, :champion_contact, :target_ids

  belongs_to :category
  has_and_belongs_to_many :targets
  has_many :social_links

  accepts_nested_attributes_for :social_links

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
		
			n=Node.create! (row.to_hash & Node.new.attributes)

			#[row['prime_category'], row['2nd_category']].each do |c|
			#	n.categories << Category.find_or_create_by_name(c)
			#end

			n.category = Category.find_or_create_by_name(row['prime_category'])
			n.social_links << SocialLink.create(:social_key=>"website", :link_url=>row['URL']) if !row['URL'].blank?

			n.save
			#puts (row.to_hash & Node.new.attributes)
		end
	end

	def classes 
		 "#{self.category.cat_class if self.category} #{self.targets.map{|t| t.cat_class }.join(' ')}"
	end
end