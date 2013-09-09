# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end
#
# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.acronym 'RESTful'
# end


module ActiveSupport::Inflector
  # does the opposite of humanize.... mostly. Basically does a
  # space-substituting .underscore
  def linked(the_string)
    linked = text.gsub( %r{http://[^\s<]+} ) do |url|
		"<a href='#{url}'>#{url}</a>"
	end

	linked = text.gsub( %r{@[^\s<]+} ) do |url|
		link = url
		link[0]=''
		"<a href='http://twitter.com/#{link}'>#{url}</a>"
	end

	linked
  end
end
class String
  def linked
    ActiveSupport::Inflector.linked(self)
  end
end