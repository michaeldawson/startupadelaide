class StaticController < ApplicationController
  def index
  	@nodes = Node.all
  	@categories = Category.all
  	@palette=["d06e39","#bbb", "#50b1a0", "#50b189", "#F26B6B", "#d04275", "#d68f2a", "#d06e39", "#4971A6"].reverse
  end
end
