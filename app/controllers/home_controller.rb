class HomeController < ApplicationController
  def index
  	@items = Item.all 
    @brands = Brand.all
	# @categories = Category.all
  end
end
