ActiveAdmin.register Brand do
  permit_params :list, :of, :attributes, :on, :model, :name, :icon, :description
  index do    
    column :name 
    column :slug
    column "icon" do |category|
      image_tag category.icon_url(:icon)
    end
    column "" do |resource|
      links = ''.html_safe
      links += link_to I18n.t('active_admin.view'), resource_path(resource), :class => "member_link view_link"
      links += link_to I18n.t('active_admin.edit'), edit_resource_path(resource), :class => "member_link edit_link"
      links += link_to I18n.t('active_admin.delete'), resource_path(resource), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
      links
    end
  end
end
