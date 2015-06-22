class CmsController < InheritedResources::Base

  private

    def cm_params
      params.require(:cm).permit(:terms_of_use, :contact_us, :cash_on_delivery, :free_shipping, :privacy, :policy, :blog, :need_, :help)
    end
end

