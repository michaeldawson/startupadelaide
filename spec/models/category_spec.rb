require 'spec_helper'

describe Category do
	it "has a valid factory" do
		FactoryGirl.create(:category).should be_valid
	end

	it "parameterises on create" do
		cat= FactoryGirl.create(:category, name:"This is a test string")
		cat.cat_class.should == "this_is_a_test_string"
	end
end
