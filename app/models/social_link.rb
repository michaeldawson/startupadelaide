class SocialLink < ActiveRecord::Base
  attr_accessible :link_url, :node_id, :social_key

  belongs_to :node
end
