class AddGsmToItem < ActiveRecord::Migration
  def change
    add_column :items, :gsm, :string
  end
end
