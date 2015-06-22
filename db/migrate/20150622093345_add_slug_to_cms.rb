class AddSlugToCms < ActiveRecord::Migration
  def change
    add_column :cms, :slug, :string
  end
end
