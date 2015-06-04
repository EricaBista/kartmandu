class AddIsDiscountedToItem < ActiveRecord::Migration
  def change
    add_column :items, :is_discounted, :boolean
  end
end
