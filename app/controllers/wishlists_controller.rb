class WishlistsController < InheritedResources::Base
	 before_filter :authorize, only: [:update, :create]
def index
    @wishlists = Wishlist.all
  end
  
  def create
 @wishlist = Wishlist.new(wishlist_params)
 puts @wishlist.inspect
    respond_to do |format|
      @wishlist.user_id = current_user.id if current_user
      if @wishlist.save 
        format.html { redirect_to slugged_path(Item.find_by_id(@wishlist.item_id).slug), notice: 'Added to Wishlist' }
        format.json { render :show, status: :created, location: @wishlist }
      else
        format.html { redirect_to item_path(@wishlist.item_id) }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
  	@wishlist = Wishlist.find(params[:id])
    @wishlist.destroy
    respond_to do |format|
      format.html { redirect_to slugged_path(Item.find_by_id(@wishlist.item_id).slug), notice: 'wishlist was successfully destroyed.' }
      format.json { head :no_content }
    end
end
  private

    def wishlist_params
      params.require(:wishlist).permit(:item_id, :user_id)
    end

     def authorize
    unless current_user
      flash[:notice] = "Login to add wishlist !!"
      redirect_to new_user_session_path
    end
  end
end

