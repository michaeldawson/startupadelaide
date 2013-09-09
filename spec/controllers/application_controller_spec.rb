require 'spec_helper'

describe ApplicationController do
  describe "linked" do
  	it "returns linked text for anchors" do
  		text = "this a sentence with a link http://google.com"
  		linked(text).should == "this a sentence with a link <a href='http://google.com'>http://google.com</a>"
  	end

  	it "returns links for twitter ids" do
  		text = "this a sentence with a twitter id @startupaus"
  		linked(text).should == "this a sentence with a twitter id <a href='http://twitter.com/startupaus>@startupaus</a>"
  	end
  end
end