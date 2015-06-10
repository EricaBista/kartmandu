class AddBatteryTypeToItem < ActiveRecord::Migration
  def change
    add_column :items, :battery_type, :string
  end
end
