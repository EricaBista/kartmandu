class AddSoldOutToItem < ActiveRecord::Migration
  def change
    add_column :items, :sold_out, :integer
  end
end
