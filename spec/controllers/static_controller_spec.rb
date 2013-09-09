require 'spec_helper'

describe StaticController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "POST 'post'" do
    it "returns http success" do
      get 'post'
      response.should be_success
    end
  end

end
