ActiveAdmin.register Category do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :list, :of, :attributes, :on, :model, :name, :description, :slug, :banner_image
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
     column :slug
          column "banner_image" do |category|
      image_tag category.banner_image_url(:small)
     end
    
     # column :category do |c|
     #    c.category.name
     #  end
    
     column "" do |resource|
      links = ''.html_safe
      links += link_to I18n.t('active_admin.view'), resource_path(resource), :class => "member_link view_link"
      links += link_to I18n.t('active_admin.edit'), edit_resource_path(resource), :class => "member_link edit_link"
      links += link_to I18n.t('active_admin.delete'), resource_path(resource), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
      links
    end
  end

 form do |f|
      f.inputs "Category" do
      # add your other inputs
      
      f.input :name
    f.input :slug
      
      f.input :description
      f.input :banner_image, :as => :file, :hint => image_tag(f.object.banner_image.url(:thumb))

     end 
      f.actions 
end

show do |category|
  attributes_table do

    row :name
    row :slug
    row :description
   end
    end
end
