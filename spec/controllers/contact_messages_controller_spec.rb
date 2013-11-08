require 'spec_helper'

describe ContactMessagesController do

  describe "POST 'contact message'" do
    context "with valid params" do
      before :each do
        @valid_message = FactoryGirl.attributes_for(:contact_message)
      end

      it "recognises params as valid" do
        ContactMessage.new(@valid_message).should be_valid
      end

      it "creates the contact message" do
        expect {
          post :create, contact_message: @valid_message
        }.to change {
            ContactMessage.count
        }.by(1)
      end

      it "redirects to the contact page" do
        post :create, contact_message: @valid_message
        response.should redirect_to contact_path
      end

      it "sets the flash message" do
        post :create, contact_message: @valid_message
        assert flash[:notice]
      end
    end

    context "with invalid params" do
      before :each do
        @invalid_message = FactoryGirl.attributes_for(:contact_message)
        @invalid_message[:message] = nil
      end

      it "recognises params as invalid" do
        ContactMessage.new(@invalid_message).should_not be_valid
      end

      it "redirects to the contact page with a flash error message" do
        post :create, contact_message: @invalid_message
        response.should redirect_to contact_path
        assert flash[:error]
      end

    end
  end


end
