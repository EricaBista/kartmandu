ActiveAdmin.register Item do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :list, :of, :attributes, :on, :model, :name, :model_number, :slug, :form, :operating_system, :screen_size, :SIM, :color, :title, :available, :sold_out, :box_content, :dimension, :display_resolution, :multitouch, :rear_camera, :front_camera, :flash, :bluetooth, :audio_jack, :gsm, :battery_capacity, :battery_type, :is_discounted, :is_hot_deal, :is_featured, :description, :price, :order, :image, :category_id, :brand_id
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
     column :name 
     column :model_number 
     column :slug
     column :form

column :box_content
column :dimension
column :display_resolution
column :rear_camera
column :front_camera
column :flash
column :bluetooth
column :audio_jack
column :gsm
column :battery_type
column :battery_capacity
column :multitouch


     column :operating_system 
     column :color 
     column :SIM
      column :screen_size
      
     column :available
     column :sold_out
     column :price
     column :order
     column :is_discounted
     column :is_hot_deal
     column :is_featured
     # column :category do |c|
     #    c.category.name
     #  end
     #  column :brand do |b|
     #    b.brand.name
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
      f.input :title 
      f.input :name 
      f.input :model_number 
      f.input :slug
       f.input :form
        f.input :operating_system
         f.input :screen_size
          f.input :box_content
           f.input :dimension
            f.input :display_resolution
             f.input :multitouch, as: :select, collection: ['YES', 'NO'], :prompt => true
              f.input :rear_camera
               f.input :front_camera
                f.input :flash, as: :select, collection: ['YES', 'NO'], :prompt => true
                 f.input :bluetooth
                  f.input :audio_jack
                   f.input :gsm
                    f.input :battery_capacity
                     f.input :battery_type
           f.input :SIM
      f.input :available
      f.input :sold_out
      f.input :price
      f.input :description
      f.input :order
      f.input :image, :as => :file, :hint => image_tag(f.object.image.url(:thumb))
      f.input :is_discounted
      f.input :is_hot_deal
       f.input :is_featured
     end 
      f.actions 
end

 show do |item|
  attributes_table do
    row :title
    row :name
 row :model_number
    row :slug
    row :SIM
    row :screen_size
    row :operating_system
    row :form
    row :color
 row :box_content
  row :dimension
   row :display_resolution
    row :multitouch
     row :rear_camera
      row :front_camera
       row :flash
        row :bluetooth
         row :audio_jack
          row :gsm
           row :battery_type
            row :battery_capacity

    row :available
    row :sold_out
    row :price
    row :order
    row :category_id
    row :brand_id
    end
  end
end
