class StaticController < ApplicationController
  def index
  	@background_img=1
  end

  def about
    @overlay_color = "green1" 
    @background_img=6
    @header = "About"
  end

  def contact
    @overlay_color = "orange"
    @background_img=3
    @header = "Get in touch"
  end

  def search
    @overlay_color = "pink" 
    @background_img=7
    @header = "Search the community"
  end

  def explore
    @overlay_color = "white" 
    @background_img=4
    @header = "Explore the community"

    @nodes = Node.all
    @categories = Category.all
    @targets = Target.all
    
    @palette=["d06e39","#bbb", "#50b1a0", "#50b189", "#F26B6B", "#d04275", "#d68f2a", "#d06e39", "#4971A6"].reverse
  end
end

