class AddModelNumberToItem < ActiveRecord::Migration
  def change
    add_column :items, :model_number, :string
  end
end
