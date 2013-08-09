class StaticController < ApplicationController
  def index
  	@nodes = Node.all
  	@categories = Category.all
  end
end
