class AddBatteryCapacityToItem < ActiveRecord::Migration
  def change
    add_column :items, :battery_capacity, :string
  end
end
