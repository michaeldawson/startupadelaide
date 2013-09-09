module StaticHelper
	def linked(text)
		linked = text.gsub( %r{http://[^\s<]+} ) do |url|
			"<a href='#{url}'>#{url}</a>"
		end

		linked = text.gsub( %r{@[^\s<]+} ) do |url|
			link = url
			link[0]=''
			"<a href='#{link}'>#{url}</a>"
		end

		linked
	end
end
