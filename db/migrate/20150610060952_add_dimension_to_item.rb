class AddDimensionToItem < ActiveRecord::Migration
  def change
    add_column :items, :dimension, :string
  end
end
