require 'spec_helper'

describe Node do
	it { should have_and_belong_to_many(:targets) }


	context "a node" do
		before :each do
			@node = FactoryGirl.create(:node)
		end

		context "with a category and targets" do
			before :each do
				@node.category=FactoryGirl.create(:category, name: "Startup events")
				@node.targets << FactoryGirl.create(:target, name: "Newbies")
				@node.save
				@node.reload
			end

			it "returns its classes" do
				@node.classes.should == "startup_events newbies"
			end
		end
	end
end