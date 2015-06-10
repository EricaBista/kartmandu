class AddDisplayResolutionToItem < ActiveRecord::Migration
  def change
    add_column :items, :display_resolution, :string
  end
end
