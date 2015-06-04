class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_menu
  def set_menu
  	@menus ||= Category.all
  	@headers ||= Category.where(:is_menu => true)
     @budget ||=Item.where(:is_discounted => true)
    
  end
end
