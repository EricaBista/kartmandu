class AddFormToItem < ActiveRecord::Migration
  def change
    add_column :items, :form, :string
  end
end
