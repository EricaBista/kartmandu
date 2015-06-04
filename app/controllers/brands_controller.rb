class BrandsController < InheritedResources::Base
def list
	@bran = Item.find_by_brand_id(params[:id])
end
  private

    def brand_params
      params.require(:brand).permit(:name, :icon, :description)
    end
end

