class AjaxController < ApplicationController
  def tweets
  	@tweets = Tweet.where(user_screen_name: "Startupaus")
  	render json: linked(@tweets.to_json)
  end

  def mentions
  	@tweets = Tweet.where('user_screen_name != ?', 'StartupAus')
  	render json: linked(@tweets.to_json)
  end
end
