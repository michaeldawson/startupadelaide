class Tweet < ActiveRecord::Base
  attr_accessible :text, :user_screen_name
end
