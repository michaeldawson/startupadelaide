class BlogPostsController < InheritedResources::Base
  before_action :set_blog_post, only: [:show]

  def index
    @blog_posts = BlogPost.last(4)
    @overlay_color = "blue" 
    @background_img=5
    @header = "Blog"
  end

  def show
    @overlay_color = "blue"
    @header = "Test"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_post
      @blog_post = BlogPost.find(params[:id])
    end
end
