class AddCurrencyToCart < ActiveRecord::Migration
  def change
    add_column :carts, :currency, :integer
  end
end
