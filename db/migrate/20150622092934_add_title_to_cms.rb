class AddTitleToCms < ActiveRecord::Migration
  def change
    add_column :cms, :title, :string
  end
end
