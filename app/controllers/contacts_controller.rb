class ContactsController < InheritedResources::Base

    def cms
      @contact = Contact.find_by_slug!(params[:slug])
       
    end


	def index
		@contacts = Contact.all
	end

  private

    def contact_params
      params.require(:contact).permit(:slug, :title, :description, :order, :home_page)
    end
end

