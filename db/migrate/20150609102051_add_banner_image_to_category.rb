class AddBannerImageToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :banner_image, :string
  end
end
