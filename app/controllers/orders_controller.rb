class OrdersController < InheritedResources::Base



  private

    def order_params
      params.require(:order).permit(:express_token, :express_payer_id, :cart_id)
    end
end

