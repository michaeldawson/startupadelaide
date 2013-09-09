class ApplicationController < ActionController::Base
  protect_from_forgery

  	def linked(text)
		linked = text.gsub( %r{http://[^\s<]+} ) do |url|
			"<a href='#{url}'>#{url}</a>"
		end

		linked = text.gsub( %r{\@[^\s<]+} ) do |url|
			link = url
			link[0]=''
			"<a href='http://twitter.com/#{link}' target='_blank'>#{url}</a>"
		end

		linked
	end
end
