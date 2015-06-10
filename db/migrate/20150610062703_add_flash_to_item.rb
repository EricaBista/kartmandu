class AddFlashToItem < ActiveRecord::Migration
  def change
    add_column :items, :flash, :string
  end
end
