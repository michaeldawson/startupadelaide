class BlogPost < ActiveRecord::Base
  belongs_to :admin_user
end
