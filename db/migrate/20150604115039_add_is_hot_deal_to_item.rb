class AddIsHotDealToItem < ActiveRecord::Migration
  def change
    add_column :items, :is_hot_deal, :boolean
  end
end
