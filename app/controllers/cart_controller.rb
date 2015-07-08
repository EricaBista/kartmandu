class CartController < ApplicationController
# before_action :authenticate_user!, except: [:index]

	def add 
		# id =  params[:id]
		# if session[:cart] then
		# 	cart = session[:cart]
		# else
		# 	session[:cart] = {} 
		# 	cart = session[:cart]
	 #    end
	 #    if cart[id] then
	 #    	cart[id] =  cart[id] + 1
	 #    else
	 #    	cart[id] = 1
	 #    end
	 
if params[:quantity]
	 quantity = params[:quantity].to_i
	else quantity = 1
	end
@item = Item.find(params[:id])
	if session[:cart] 
 	 exists = LinesItem.where(:cart_id => @cart_session, :item_id => @item.id).first
 	 puts exists.inspect
 	 if exists.id
 	 	exists.quantity = exists.quantity + quantity
 	 	exists.save
 	 else
    @line_item = LinesItem.create!(:cart_id => @cart_session, :item_id => @item.id, :quantity => quantity, :unit_price => @item.price)

end
redirect_to :action => :index	
else
    @cart = Cart.new()

    respond_to do |format|
      if @cart.save
      	session[:cart] = @cart.id
      	  @line_item = LinesItem.create!(:cart_id => session[:cart], :item_id => @item.id, :quantity => 1, :unit_price => @item.price)

        format.html { redirect_to slugged_path(@item.slug), notice: 'cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: slugged_path(@item.slug).errors, status: :unprocessable_entity }
      end
    end
end



	    
	end

	def clearCart
		session[:cart] = nil
		redirect_to :action => :index
	end


  def index
  	#@cart = Cart.all
  	# if session[:cart] then
  	# 	@cart = session[:cart]
  	# else
  	# 	@cart = {}
  	# end

  end
end
