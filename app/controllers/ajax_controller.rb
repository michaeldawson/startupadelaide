class AjaxController < ApplicationController
  def tweets

  	@tweets = Tweet.where(user_screen_name: "StartupADL")
  	render json: (@tweets.to_json)

  end

  def mentions
  	@tweets = Tweet.where('user_screen_name != ?', 'StartupADL')
  	render json: (@tweets.to_json)
  end
end
