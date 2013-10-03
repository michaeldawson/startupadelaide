require 'spec_helper'

describe Target do
	it "has a valid factory" do
		FactoryGirl.create(:target).should be_valid
	end

	it "parameterises on create" do
		target= FactoryGirl.create(:target, name: "This is a test string")
		target.cat_class.should == "this_is_a_test_string"
	end
end
