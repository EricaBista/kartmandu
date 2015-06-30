class OrdersController < InheritedResources::Base

def express_checkout
  response = EXPRESS_GATEWAY.setup_purchase(0,
    # ip: request.remote_ip,
    return_url: root_path,
    cancel_return_url: root_path,
    currency: "USD",
    allow_guest_checkout: true,
    items: [{name: "Order", description: "Order description", quantity: "1", amount: 0}]
  )
  redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
end

def new
  @order = Order.new(:express_token => params[:token])
end

def create
  @order = @cart.build_order(order_params)
  # @order.ip = request.remote_ip

  if @order.save
    if @order.purchase # this is where we purchase the order. refer to the model method below
      redirect_to order_url(@order)
    else
      render :action => "failure"
    end
  else
    render :action => 'new'
  end
end




  private

    def order_params
      params.require(:order).permit(:express_token, :express_payer_id, :cart_id)
    end
end

