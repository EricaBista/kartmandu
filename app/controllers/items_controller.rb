class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy, :buy]

  def index
    @items = Item.all
  end
  
  def buy
    @item_buy = Item.where(:item_id => @item.id)
  end
 
  def show
   @item = Item.find_by_slug!(params[:slug])
   @item_ass = Item.joins(:category).where('categories.name' => "Accessories").limit(4).order("RANDOM()")
   @items = Item.where(:category_id => @item.category_id).where.not(:id => @item.id).limit(4).order("RANDOM()")
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

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
  end

  private
    
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :brand_id, :price, :order, :image, :slug)
  end
end
