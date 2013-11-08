require 'spec_helper'

describe AjaxController do
	context "with tweets" do
		before :each do
			3.times do
				FactoryGirl.create(:tweet)
			end

			3.times do
				FactoryGirl.create(:tweet, :user_screen_name=>"StartupADL")
			end
		end

		describe "GET 'tweets'" do    
		    it "returns tweets" do
		      xhr :get, :tweets
		      parsed_body = JSON.parse(response.body)
		      parsed_body.first["text"].should be_kind_of(String)
		    end
		end

		describe "GET 'mentions'" do
		    it "returns tweets" do
		      xhr :get, :mentions
		      parsed_body = JSON.parse(response.body)
		      parsed_body.first["text"].should be_kind_of(String)
		    end
		end
	end
end
