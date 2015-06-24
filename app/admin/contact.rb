ActiveAdmin.register Contact do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :list, :of, :attributes, :on, :model, :name, :title, :description, :slug, :home_page, :order
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

index do  
 column :name  
     column :title 
     column :slug 
     column :description 
     column :order
     column :home_page

column :box_content

     column "" do |resource|
      links = ''.html_safe
      links += link_to I18n.t('active_admin.view'), resource_path(resource), :class => "member_link view_link"
      links += link_to I18n.t('active_admin.edit'), edit_resource_path(resource), :class => "member_link edit_link"
      links += link_to I18n.t('active_admin.delete'), resource_path(resource), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
      links
    end
  end

form do |f|
      f.inputs "Contact" do
      # add your other inputs
       f.input :name
      f.input :title
    f.input :slug
      
      f.input :description
      f.input :order
       f.input :home_page

     end 
      f.actions 
end



end
