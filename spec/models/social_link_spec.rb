require 'spec_helper'

describe SocialLink do
	it "replaces www with http format" do
		@sl = FactoryGirl.create(:social_link, link_url: "www.google.com")
		@sl.link_url.should == "http://www.google.com"
	end

	it "doesn't replace http://www" do
		@sl = FactoryGirl.create(:social_link, link_url: "http://www.google.com")
		@sl.link_url.should == "http://www.google.com"
	end
end
