class CreateLinesItems < ActiveRecord::Migration
  def change
    create_table :lines_items do |t|
      t.integer :item_id
      t.integer :cart_id
      t.integer :unit_price
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
