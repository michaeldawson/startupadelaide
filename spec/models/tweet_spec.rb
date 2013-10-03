require 'spec_helper'

describe Tweet do

	context "with links" do
		it "returns linked text for anchors" do
			text = "this a sentence with a link http://google.com"
			tweet = FactoryGirl.create(:tweet, text: text)
			tweet.text.should == "this a sentence with a link <a href='http://google.com' target='_blank'>http://google.com</a>"
		end

		it "returns links for twitter ids" do
			text = "this a sentence with a twitter id @startupaus"
			tweet = FactoryGirl.create(:tweet, text: text)
			tweet.text.should == "this a sentence with a twitter id <a href='http://twitter.com/startupaus' target='_blank'>@startupaus</a>"
		end
	end
end
