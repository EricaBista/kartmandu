class AddMultitouchToItem < ActiveRecord::Migration
  def change
    add_column :items, :multitouch, :string
  end
end
