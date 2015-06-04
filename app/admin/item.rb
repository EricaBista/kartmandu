ActiveAdmin.register Item do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :list, :of, :attributes, :on, :model, :name, :slug, :is_discounted, :description, :price, :order, :image
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
     column :price
     column :order
     column :is_discounted
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
      f.inputs "Item" do
      # add your other inputs
      f.input :category, :collection => Category.all.map{ |category| [category.name, category.id] },:prompt => true
       f.input :brand, :collection => Brand.all.map{ |brand| [brand.name, brand.id] },:prompt => true
      f.input :name
      f.input :slug
      f.input :price
      f.input :description
      f.input :order
       f.input :image, :as => :file, :hint => image_tag(f.object.image.url(:thumb))
f.input :is_discounted
     end 
      f.actions 
end

 show do |item|
  attributes_table do

    row :name
    row :slug
    row :price
    row :order
    end
  end
end
