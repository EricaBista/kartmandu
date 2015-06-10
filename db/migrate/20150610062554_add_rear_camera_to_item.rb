class AddRearCameraToItem < ActiveRecord::Migration
  def change
    add_column :items, :rear_camera, :string
  end
end
