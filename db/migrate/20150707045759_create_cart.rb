class CreateCart < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :total_amount_of_cent
    end
  end
end
