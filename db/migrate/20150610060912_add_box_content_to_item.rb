class AddBoxContentToItem < ActiveRecord::Migration
  def change
    add_column :items, :box_content, :string
  end
end
