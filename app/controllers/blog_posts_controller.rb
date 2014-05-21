class BlogPostsController < InheritedResources::Base

  def index
    @blog_posts = BlogPost.all
    @overlay_color = "blue" 
    @background_img=5
    @header = "Blog"
  end
end
