class StaticController < ApplicationController
  def index
  	
  end

  def about
    @overlay_color = "green1" 
  end

  def contact
    @overlay_color = "orange"
    flash[:notice]="laksjdasgd"
  end

  def search
    @overlay_color = "pink" 
  end

  def explore
    @overlay_color = "white" 
    @nodes = Node.all
    @categories = Category.all
    @targets = Target.all
    
    @palette=["d06e39","#bbb", "#50b1a0", "#50b189", "#F26B6B", "#d04275", "#d68f2a", "#d06e39", "#4971A6"].reverse
  end
end

