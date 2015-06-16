class WishlistsController < InheritedResources::Base
	
  private

    def wishlist_params
      params.require(:wishlist).permit(:item_id, :name)
    end
end

