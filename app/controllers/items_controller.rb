class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy, :buy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end
  
def buy
  # @item = Item.find(params[:id])
  @item_buy = Item.where(:item_id => @item.id)
end
   

  # GET /items/1
  # GET /items/1.json
  def show
   @item = Item.find_by_slug!(params[:slug])
   @item_ass = Item.joins(:category).where('categories.name' => "Accessories").limit(4).order("RANDOM()")
   @items = Item.where(:category_id => @item.category_id).where.not(:id => @item.id).limit(4).order("RANDOM()")
 # @wishlists_count=Wishlist.where(:item_id =>@item).count
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to slugged_path(@item.slug), notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to slugged_path(@item.slug), notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def search
      @q=params[:q]
      @category_id = params[:home]
     if @category_id[:category_id].present?
      @items = Item.item_search(params[:q]).where("category_id =?", @category_id[:category_id])
        
        else
           @items = Item.item_search(params[:q])
         end
        # @categories = Category.category_search(params[:q])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :description, :category_id, :brand_id, :price, :order, :image, :slug)
    end
end
