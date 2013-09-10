class SocialLink < ActiveRecord::Base
  attr_accessible :link_url, :node_id, :social_key, :node

  belongs_to :node

  before_save :refactor_www


  def refactor_www
  	#take www.google.com and convert it to http://www.google.com

  	url = self.link_url

  	if url.match(/www/) && !(url.match(/http:\/\/www/))
  		self.link_url = url.gsub(/www/, "http://www")
  	end
  end
end
