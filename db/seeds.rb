# encoding: utf-8

['facebook', 'twitter', 'website', 'google_plus'].each do |sl|
	SocialLinkPrefill.create(:name=>sl)
end

['newbies', 'students', 'entrepreneurs', 'startups'].each do |t|
	Target.create(name: t)
end
