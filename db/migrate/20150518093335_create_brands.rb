class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.string :icon
      t.text :description

      t.timestamps null: false
    end
  end
end
