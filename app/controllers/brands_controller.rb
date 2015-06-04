class BrandsController < InheritedResources::Base

def list_brand_items

      @brand = Brand.find_by_slug!(params[:slug])
      @items = Item.where :brand_id => @brand.id 
    end

  private

    def brand_params
      params.require(:brand).permit(:name, :icon, :description, :slug)
    end
end

