class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_menu
  def set_menu
  	@menus ||= Category.all
  	@headers ||= Category.where(:is_menu => true)
     @budget ||=Item.where(:is_discounted => true)
     @hotdeal ||=Item.where(:is_hot_deal => true).order("RANDOM()") 
      @featured ||=Item.where(:is_featured => true)
      @cart = session[:cart]
 
     
  end
end
