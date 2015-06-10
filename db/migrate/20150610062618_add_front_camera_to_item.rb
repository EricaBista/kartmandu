class AddFrontCameraToItem < ActiveRecord::Migration
  def change
    add_column :items, :front_camera, :string
  end
end
