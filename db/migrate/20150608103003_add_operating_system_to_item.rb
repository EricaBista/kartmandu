class AddOperatingSystemToItem < ActiveRecord::Migration
  def change
    add_column :items, :operating_system, :string
  end
end
