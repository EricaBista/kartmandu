ActiveAdmin.register Contact do
  permit_params :list, :of, :attributes, :on, :model, :name, :title, :description, :slug, :home_page, :order
  
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
