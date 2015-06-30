class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :express_token
      t.string :express_payer_id
      t.references :cart, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
