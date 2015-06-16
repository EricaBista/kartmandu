class WishlistsController < InheritedResources::Base

  private

    def wishlist_params
      params.require(:wishlist).permit(:item_id_id, :user_id_id)
    end
end

