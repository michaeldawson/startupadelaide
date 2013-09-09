require 'spec_helper'
require 'rake'

describe "twitter:get_data" do

	before do
      load File.expand_path("../../../../lib/tasks/twitter.rake", __FILE__)
      Rake::Task.define_task(:environment)
    end

	it "gets the twitter data and persists it in database" do
		expect {
			Rake::Task[subject].invoke
		}.to change {
			Tweet.count
		}
	end
end