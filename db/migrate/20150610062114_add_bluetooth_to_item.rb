class AddBluetoothToItem < ActiveRecord::Migration
  def change
    add_column :items, :bluetooth, :string
  end
end
