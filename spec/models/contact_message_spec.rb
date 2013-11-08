require 'spec_helper'

describe ContactMessage do
	it "has a valid factory" do
		FactoryGirl.create(:contact_message).should be_valid
	end

	context "a contact message" do
		before :each do
			@contact_message = FactoryGirl.build(:contact_message)
		end

		it "isn't valid without a name" do
			FactoryGirl.build(:contact_message, name: nil).should_not be_valid
		end

		it "isn't valid without an email" do
			FactoryGirl.build(:contact_message, email: nil).should_not be_valid
		end

		it "isn't valid without a message" do
			FactoryGirl.build(:contact_message, message: nil).should_not be_valid
		end


		it "sends an email after create" do

			expect {
				@contact_message.save
			}.to change {
				ActionMailer::Base.deliveries.count
			}.by(1)

		end

		it "emails the contact email after create" do

			SiteConfiguration.contact_email.should=="brandycontent@gmail.com"

			@contact_message.save
			mail = ActionMailer::Base.deliveries.last

			mail.to.should == ["brandycontent@gmail.com"]

		end

	end
end
