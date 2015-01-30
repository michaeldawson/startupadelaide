#encoding: UTF-8

class Node < ActiveRecord::Base

  belongs_to :category
  has_and_belongs_to_many :targets
  has_many :social_links

  accepts_nested_attributes_for :social_links

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
		
			n=Node.create! (row.to_hash & Node.new.attributes)

			n.category = Category.find_or_create_by_name(row['prime_category'])
			n.social_links << SocialLink.create(:social_key=>"website", :link_url=>row['URL']) if !row['URL'].blank?

			n.save
		end
	end

	def classes 
		 "#{self.category.css_friendly_name if self.category} #{self.targets.map{|t| t.css_friendly_name }.join(' ')}"
	end
end