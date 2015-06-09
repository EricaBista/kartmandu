class AddSimToItem < ActiveRecord::Migration
  def change
    add_column :items, :SIM, :string
  end
end
