class AddScreenSizeToItem < ActiveRecord::Migration
  def change
    add_column :items, :screen_size, :string
  end
end
