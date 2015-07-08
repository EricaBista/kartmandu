class LinesItemsController < InheritedResources::Base
def create
	 @item = Item.find(params[:item_id])
    @line_item = LinesItems.create!(:cart => @cart, :item => @item, :quantity => 1, :unit_price => @item.price)
end

  private

    def lines_item_params
      params.require(:lines_item).permit(:item_id, :cart_id, :unit_price, :quantity)
    end
end
