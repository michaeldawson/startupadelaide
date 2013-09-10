class AjaxController < ApplicationController
  def tweets
  	puts "received call"
  	@tweets = Tweet.where(user_screen_name: "StartupADL")
  	render json: (@tweets.to_json)
  	puts "rendering #{@tweets.count}"
  end

  def mentions
  	@tweets = Tweet.where('user_screen_name != ?', 'StartupADL')
  	render json: (@tweets.to_json)
  end
end
