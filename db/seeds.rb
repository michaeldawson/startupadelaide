# encoding: utf-8

category = FactoryGirl.create(:category, :name=>'Networking and start-up events', :cat_class=>'networking')
['Adelaide CleanTech Network', 'Business SA (Nigel McBride)', 'Collaborate to Innovate', 'Entrepreneurs Organisation', 'Adelaide Lean Start-up Group', 'Mobile Monday', 'Silicon Beach', 'Social Startup 48', 'The Startup Club', 'Startup Weekend'].each do |n|
	FactoryGirl.create(:node, :name=>n, :category => category)
end

category = FactoryGirl.create(:category, :name=>'Formal education', :cat_class=>'education')
['Centre for the Development of Entrepreneurs University of South Australia', 'Entrepreneurs’ Challenge (eChallenge)', '(University of Adelaide)', 'Entrepreneurship, Commercialisation & Innovation Centre (ECIC)', '(Uni of Adelaide)', 'First Lego League', 'Project Competition for students', 'ThIncLab Commercialisati on Accelerator', '(University of Adelaide)', 'Northern Region Enterprise Day', '(Uni of Adelaide) for Primary & Secondary Students', 'Western Region Enterprise Day', '(Uni of Adelaide) for Primary & Secondary Students', 'Flinders University business education programs', 'University of Adelaide business education programs', 'University of South Australia business education programs'].each do |n|
	FactoryGirl.create(:node, :name=>n, :category => category)
end

category = FactoryGirl.create(:category, :name=>'Industry education', :cat_class=>'industry')
['Digital360Lab', 'SA Film Corporation', 'MEGA Digital Media Entrepreneurship Masterclass', 'SA Young Entrepreneur Scheme (SAYES)', 'The Social Enterprise Workshop', 'Venturedorm', '(Flinders University)', 'Young Business Leaders’ Program', 'Business SA Coaching & Mentoring Program'].each do |n|
	FactoryGirl.create(:node, :name=>n, :category => category)
end

category = FactoryGirl.create(:category, :name=>'Coworking spaces', :cat_class=>'coworking')
['Base64 (KentTown)', 'Co-West Coworking & Writing Studio', 'Fab Lab Adelaide', 'Fifth Quarter (Carclew)', 'Hackerspace Adelaide', 'Hub Adelaide', 'Marjoran Distillery', 'Office Groove (Pt Adelaide)', 'Ontria Office (Norwood)', 'That Space (Norwood)', 'The Workhouse'].each do |n|
	FactoryGirl.create(:node, :name=>n, :category => category)
end

category = FactoryGirl.create(:category, :name=>'Incubators and Accelerators', :cat_class=>'incubators')
['ANZ Innovyz START', 'BioSA incubator', 'ThincLab Business Incubator (University of Adelaide)'].each do |n|
	FactoryGirl.create(:node, :name=>n, :category => category)
end

category = FactoryGirl.create(:category, :name=>'Government funding', :cat_class=>'government')
['SA Cleantech Grant', 'SA Gateway Program', 'SA Innovation Voucher Program'].each do |n|
	FactoryGirl.create(:node, :name=>n, :category => category)
end

category = FactoryGirl.create(:category, :name=>'Investors', :cat_class=>'investors')
['Acumen VC Fund', 'ASSOB', 'BioAngels', 'Blue Sky Private Equity', 'SA Angels', 'Terra Rosa Capital'].each do |n|
	FactoryGirl.create(:node, :name=>n, :category => category)
end

['facebook', 'twitter', 'website'].each do |sl|
	SocialLinkPrefill.create(:name=>sl)
end

Node.all.each do |n|
	SocialLinkPrefill.all.each do |sl|
		n.social_links << SocialLink.create(:social_key=>sl.name, :link_url=>"http://#{sl.name}.com")
	end
end

Node.all.each do |n|
	n.what = "This program is a..."
	n.who_for = "This program is designed for..."
	n.more = "To find out more, go to..."
	n.save
end