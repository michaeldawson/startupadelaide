namespace :twitter do
  desc "Get data from twitter API and store in database"
	task :get_data => :environment do

		@tweets = Twitter.user_timeline('startupadl')
		#@tweets_aus = Twitter.user_timeline('startupaus')
		@tweets.concat(Twitter.mentions_timeline)

		Tweet.delete_all

		@tweets.each do |t|
			Tweet.create(text: t.text, user_screen_name: t.user.screen_name)
		end
	end
end
