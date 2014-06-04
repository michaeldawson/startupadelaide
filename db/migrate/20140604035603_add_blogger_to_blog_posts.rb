class AddBloggerToBlogPosts < ActiveRecord::Migration
  def change
    add_reference :blog_posts, :blogger, index: true
  end
end
