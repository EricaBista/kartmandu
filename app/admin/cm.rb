ActiveAdmin.register Cm do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :list, :of, :attributes, :on, :model, :terms_of_use, :slug, :title, :contact_us, :cash_on_delivery, :free_shipping, :privacy, :policy, :blog, :need_, :help
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
index do   
	column :title 
	column :slug 
     column :terms_of_use 
     column :contact_us 
     column :cash_on_delivery 
     column :free_shipping
     column :privacy
     column :policy
     column :help
     column :need_
     column :blog
column "" do |resource|
      links = ''.html_safe
      links += link_to I18n.t('active_admin.view'), resource_path(resource), :class => "member_link view_link"
      links += link_to I18n.t('active_admin.edit'), edit_resource_path(resource), :class => "member_link edit_link"
      links += link_to I18n.t('active_admin.delete'), resource_path(resource), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
      links
    end
  end

  form do |f|
      f.inputs "Cm" do
      # add your other inputs
      
  f.input :title
  f.input :slug
  f.input :terms_of_use
  f.input :contact_us
  f.input :cash_on_delivery
  f.input :free_shipping
  f.input :privacy
  f.input :policy
  f.input :help
  f.input :need_
  f.input :blog

end
 
 f.actions 

end
      
end
