class ContactsController < InheritedResources::Base

  private

    def contact_params
      params.require(:contact).permit(:slug, :title, :description, :order, :home_page)
    end
end

