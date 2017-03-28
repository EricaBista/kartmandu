class CartController < ApplicationController
# before_action :authenticate_user!, except: [:index]
	def add 
		quantity = params[:quantity].to_i
		if quantity <= 0
			quantity = 1
		end
		@item = Item.find(params[:id])
		if session[:cart] 
			exists = LinesItem.where(:cart_id => @cart_session, :item_id => @item.id).first
			if exists.present?
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
		    @line_item = LinesItem.create!(:cart_id => session[:cart], :item_id => @item.id, :quantity => quantity, :unit_price => @item.price)

		    format.html { redirect_to slugged_path(@item.slug), notice: 'cart was successfully created.' }
		    format.json { render :show, status: :created, location: @cart }
		  else
		    format.html { render :new }
        format.json { render json: slugged_path(@item.slug).errors, status: :unprocessable_entity }
      end
    end
	end 

	def clearCart
		session[:cart] = nil
		redirect_to :action => :index
	end


  def index
  end
end
