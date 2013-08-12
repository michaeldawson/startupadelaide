class SocialLink < ActiveRecord::Base
  attr_accessible :link_url, :node_id, :social_key, :node

  belongs_to :node
end
