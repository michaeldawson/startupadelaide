namespace :twitter do
  desc "Get data from twitter API and store in database"
	task :get_data => :environment do

	client = Twitter::REST::Client.new do |config|
		config.consumer_key = '2HWYmG5ikPt4Tfi3VrUkg'
		config.consumer_secret = 'zl72RDsENm1ThJabBg2FcaiJjvHOtLrwIJqAdVjbAg'

		config.oauth_token = '281278165-LtAcqMzRXEN9V4Se5vh6KSMPYGHnxeksb2pYI'
		config.oauth_token_secret = '05ikoPxjTTgtdiOzduQcSmX14xOllsgGG6u42Sx5IZ4'
	end

		@tweets = client.user_timeline('startupadl')
		#@tweets_aus = Twitter.user_timeline('startupaus')
		@tweets.concat(client.mentions_timeline)

		Tweet.delete_all

		@tweets.each do |t|
			Tweet.create(text: t.text, user_screen_name: t.user.screen_name)
		end
	end
end
