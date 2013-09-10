class Tweet < ActiveRecord::Base
  attr_accessible :text, :user_screen_name

  before_save :linkify

  def linkify
  	text = self.text

	text = text.gsub( %r{http://[^\s<]+} ) { |url| "<a href='#{url}' target='_blank'>#{url}</a>" }

	text = text.gsub( %r{\@[^\s<]+} ) do |url|
		link = String.new(url)
		link[0]=''
		"<a href='http://twitter.com/#{link}' target='_blank'>#{url}</a>"
	end

	self.text = text
  end
end
