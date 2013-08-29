# encoding: utf-8

['facebook', 'twitter', 'website'].each do |sl|
	SocialLinkPrefill.create(:name=>sl)
end
