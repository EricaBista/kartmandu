class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.integer :item_id
      t.string :name

      t.timestamps null: false
    end
  end
end
